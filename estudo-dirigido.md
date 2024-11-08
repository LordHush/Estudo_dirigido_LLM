# Estudo Dirigido: Como LLM Pode Promover o Aprendizado e o Desenvolvimento de Aplicações Ruby
A inteligência artificial (IA) tem se tornado uma ferramenta poderosa para o aprendizado de programação, incluindo o desenvolvimento de aplicações Ruby. As Large Language Models (LLMs), como o ChatGPT, têm mostrado grande potencial no auxílio à compreensão e implementação de códigos, oferecendo explicações detalhadas, alternativas de soluções e análises críticas. Este estudo dirigido visa explorar como LLM pode promover o aprendizado e o desenvolvimento de aplicações Ruby, com base na resolução de problemas práticos.Este estudo dirigido explora como o uso de Modelos de Linguagem de Grande Escala (LLMs) pode auxiliar no aprendizado e no desenvolvimento de aplicações Ruby, com foco em um conjunto de exercícios que envolvem manipulação de strings, coleções, e a implementação de jogos simples (como o jogo "Pedra, Papel e Tesoura"). A proposta é discutir como os LLMs ajudam na compreensão de conceitos, resolução de problemas, e no desenvolvimento de soluções alternativas para os desafios comuns encontrados ao programar em Ruby, todos os desafios foram feitos mediante auxilio da LLM CHATGPT 3.

# Resolução dos Exercícios - Partes 01 a 06 do Homework 01

# Exercício metodo palindrome? e seus aprimoramentos: Verificação de Palíndromos
Código do Exercício:

```Ruby
def palindrome?(string)
    str_formated = string.gsub(/[^a-z0-9]/i, "")
    if str_formated.downcase == str_formated.downcase.reverse
        true
    else
        false
    end
end
```
Explicação do Algoritmo: O método ```palindrome?``` recebe uma string e remove caracteres não alfanuméricos usando gsub, garantindo que somente letras e números sejam considerados. Depois, a string formatada é comparada com sua versão invertida. Se ambas forem iguais, o método retorna true, indicando que a string é um palíndromo. Caso contrário, retorna false.

Alternativa de Implementação:

Uso de Regex: A implementação tambem pode ser otimizada ao usar uma expressão regular mais simples, sem precisar do gsub.
Uso de métodos mais declarativos ```como self == self.reverse``` para comparar a string com sua versão invertida (código mais limpo e direto).
Uma implementação funcional poderia envolver o uso de ```Enumerable#all?``` para verificar se todos os caracteres de uma string são simétricos. Isso também poderia ser feito de maneira eficiente, mas seria mais complexo do que o simples uso de reverse.

```Ruby
class String
    def palindrome?
        self == self.reverse
    end
end
```
Aqui, o método ```palindrome?``` é adicionado diretamente à classe String, permitindo que qualquer objeto do tipo String utilize este método para verificar se é um palíndromo. O método simplesmente compara a string com sua versão invertida usando self.reverse.
```Ruby
module Enumerable
    def palindrome?
        if self == self.reverse
            true
        else
            false
        end
    end
end
```
Neste versao de código, o método ```palindrome?``` foi adicionado ao módulo Enumerable, que é um módulo Ruby padrão que fornece métodos para coleções como arrays e hashes. O método compara o objeto (que pode ser uma coleção, como um array) com sua versão invertida para determinar se é um palíndromo. Essa abordagem permite que qualquer objeto que inclua o módulo ```Enumerable``` use esse método em coleções grandes, mas a comparação de coleções com a versão invertida pode ser ineficiente, uma alternativa seria iterar sobre os elementos da coleção e verificar se cada par de elementos corresponde de forma otimizada.
Exemplos de uso:
```Ruby
puts [5,2,3,2,1].palindrome?
puts "foo".palindrome?
puts palindrome?("cars")
```
# Exercício : Implementação do Jogo "Pedra, Papel, Tesoura"
```Ruby
# Classe  herdar de Exception ou StandardError
class WrongNumberOfPlayersError < StandardError
    attr_reader :erro
  
    def initialize
      @erro = "Só é possível duas pessoas disputando na partida!"
      super(@erro)
    end
  end
class NoSuchStrategyError < StandardError 
    attr_reader :message
    def initialize
        @message="Os argumentos escolhidos tem que ser Pedra(R), Papel(P) ou Tesoura(S) nada alem disso.."
    end
end

  def rps_tournament_winner(torneio)
    ganhador=''
    var=""
    torneio.each do |lista|

        
      # Verifica se o número de jogadores é maior que 2
      raise WrongNumberOfPlayersError.new if lista.length > 2
      lista.each do |elemento|
        a=elemento[1].downcase
        
        puts "Jogador #{elemento} jogou letra: " + a
        
        
        raise NoSuchStrategyError if !['p', 's', 'r'].include?(a)
        if a == 'p' and var == "r" or var ==""
            var=a
            ganhador=elemento
          
        elsif a == 's' and var == "p" or var ==""
            var=a
            ganhador=elemento
          
            
        elsif a =='r' and var == "s" or var ==""
            var=a
            ganhador=elemento
          
            
       
        end
      end
      

    end
    puts "Vencedor!"+ganhador.inspect

  end
  
  begin
    # Exemplo de torneio com erro (primeira partida com 3 jogadores)
    rps_tournament_winner([[["Kristen", "P"], ["Dave", "S"],['']],  [["Richard", "R"], ["Michael", "S"] ],[ ["Allen", "S"], ["Omer", "P"] ], [ ["David E.", "R"], ["Richard X.", "P"] ]])
  rescue WrongNumberOfPlayersError => e
    # Exibe a mensagem de erro acessando diretamente o atributo @erro
    puts "Erro: #{e.message}"
  rescue NoSuchStrategyError => c
    puts "Erro: #{c.message}"
  end
  
```
Esse  código implementa um jogo de Pedra, Papel e Tesoura para um torneio, onde o código deve identificar o vencedor de cada partida entre dois jogadores. Além disso, ele trata erros personalizados para cenários como o número de jogadores maior que dois e estratégias inválidas.
Neste código, duas exceções personalizadas são definidas: ```WrongNumberOfPlayersError```, que é levantada quando há mais de 2 jogadores, e ```NoSuchStrategyError```, que é levantada quando o jogador fornece uma estratégia inválida. Essas exceções ajudam a controlar o fluxo do jogo e garantir que apenas entradas válidas sejam processadas.

A classe ```WrongNumberOfPlayersError``` herda de ```StandardError```, que é a classe base para exceções em Ruby.
Objetivo: Esta exceção será levantada quando o número de jogadores na partida for maior do que 2.
Atributo erro: O atributo @erro armazena a mensagem de erro que será exibida quando a exceção for lançada. A mensagem diz: "Só é possível duas pessoas disputando na partida!".
O método ```super(@erro)``` chama o construtor da classe pai ```(StandardError)``` e passa a mensagem de erro.
A classe ```NoSuchStrategyErro```r também herda de ```StandardError``` e é usada para tratar casos onde o jogador fornece uma jogada inválida.
Atributo ```@message```: Armazena a mensagem de erro que será exibida quando a exceção for acionada. A mensagem diz: "Os argumentos escolhidos têm que ser Pedra(R), Papel(P) ou Tesoura(S) nada além disso..".
```Ruby
def rps_tournament_winner(torneio)
    ganhador = ''
    var = ""
    torneio.each do |lista|
        # Verifica se o número de jogadores é maior que 2
        raise WrongNumberOfPlayersError.new if lista.length > 2
        lista.each do |elemento|
            a = elemento[1].downcase
```
A função principal do código é rps_tournament_winner, que calcula o vencedor de um torneio de Pedra, Papel e Tesoura. O torneio é representado por uma estrutura de dados aninhada (uma matriz de partidas entre jogadores), e a função verifica o número de jogadores e as jogadas feitas por cada um.
Parâmetros: O parâmetro torneio é um array de partidas. Cada partida é uma lista de jogadores, onde cada jogador é um array com o nome e a jogada feita (Pedra, Papel ou Tesoura).

Variáveis:
    ganhador: armazena o vencedor da partida.

    var: armazena a jogada feita pelo primeiro jogador para comparar com a jogada do segundo jogador.

Verificação de jogadores:

    O código verifica se a partida tem mais de 2 jogadores. Se tiver, a exceção WrongNumberOfPlayersError é levantada.

Dentro de cada partida, o código compara as jogadas dos jogadores e determina quem é o vencedor
```Ruby
lista.each do |elemento|
    a = elemento[1].downcase
    raise NoSuchStrategyError if !['p', 's', 'r'].include?(a)
A variável "a" recebe a jogada do jogador (elemento[1]), convertida para minúscula para garantir que a comparação seja feita de forma consistente (independente de maiúsculas ou minúsculas). O código levanta a exceção NoSuchStrategyError se a jogada não for "p" (Pedra), "s" (Tesoura) ou "r" (Papel).

if a == 'p' and var == "r" or var == ""
    var = a
    ganhador = elemento
elsif a == 's' and var == "p" or var == ""
    var = a
    ganhador = elemento
elsif a == 'r' and var == "s" or var == ""
    var = a
    ganhador = elemento
end
```
O código verifica a jogada do primeiro jogador (var) e compara com a jogada do segundo jogador (a).
```
Pedra vs. Tesoura: Se a jogada for "Pedra" e a outra for "Tesoura", "Pedra" vence.
Tesoura vs. Papel: Se a jogada for "Tesoura" e a outra for "Papel", "Tesoura" vence.
Papel vs. Pedra: Se a jogada for "Papel" e a outra for "Pedra", "Papel" vence.
Se o vencedor ainda não foi determinado (quando var == ""), o primeiro jogador é considerado o ganhador, e a jogada dele (a) é comparada com as próximas jogadas.

A função rps_tournament_winner é chamada dentro de um bloco begin ... rescue, para capturar e tratar os erros que podem ser levantados durante a execução.
```
```Ruby
begin
    # Exemplo de torneio com erro (primeira partida com 3 jogadores)
    rps_tournament_winner([[["Kristen", "P"], ["Dave", "S"], ['']],  [["Richard", "R"], ["Michael", "S"] ],[ ["Allen", "S"], ["Omer", "P"] ], [ ["David E.", "R"], ["Richard X.", "P"] ]])
rescue WrongNumberOfPlayersError => e
    puts "Erro: #{e.message}"
rescue NoSuchStrategyError => c
    puts "Erro: #{c.message}"
end
```
Se tudo correr bem (sem erros), o vencedor da partida será impresso com a seguinte mensagem:

```puts "Vencedor!" + ganhador.inspect```
No código, o torneio é representado por arrays de jogadores. Uma alternativa seria usar Hashes para armazenar as jogadas, o que pode tornar o código mais legível, especialmente quando a chave é o nome do jogador e o valor é a jogada, como
EXEMPLO
torneio = {
  "Kristen" => "P",
  "Dave" => "S"
}


Leva um tempo relativamente curto para entender as regras do jogo de Pedra, Papel e Tesoura e como as exceções devem ser tratadas. A maior complexidade está em compreender como gerenciar múltiplos jogadores e verificar se as jogadas são válidas, o que da um certo trabalho mental pra o montar algoritmo para isso e transcrever em codigo.

# Exercício : Agrupamento de Anagramas
```Ruby
def combine_anagrams(words)
    x = words.group_by { |word| word.chars.sort.join }
    puts x.values.inspect
end

 
  combine_anagrams(['cars', 'for', 'potatoes', 'racs', 'four', 'scar', 'creams', 'scream'])
```
  Este exercício envolve agrupar anagramas. O método ```combine_anagrams``` recebe uma lista de palavras e agrupa as palavras que são anagramas. Para fazer isso, ele ordena os caracteres de cada palavra usando ```chars.sort.join```, atraves do metodo ```group_by``` que agrupa as palavras de um array em um hash, baseado em uma condicao feita em tempo de execuca, criando uma chave única para cada grupo de anagramas. As palavras com a mesma chave são agrupadas juntas.Em vez de ordenar os caracteres, uma abordagem alternativa seria criar uma chave baseada na contagem de cada caractere, o que pode ser mais eficiente dependendo do caso de uso.

  # Exercício : Definição de Classe Dessert e Herança com JellyBean
  ```Ruby
  class Dessert
    attr_accessor :name, :calories
    def initialize(name, calories)
        @name = name
        @calories = calories
    end
    
    def healthy?
        @calories < 200
    end

    def delicious?
        true
    end
end

class JellyBean < Dessert
    attr_accessor :flavor
    def initialize(name, calories, flavor)
        @flavor = flavor
        super(name, calories)
    end
    
    def delicious?
        if @flavor == "black licorice"
            false
        else
            super
        end
    end
end
```
```Classe Dessert```: Esta classe define um modelo básico de sobremesa com atributos name e calories. A função ```healthy?``` determina se a sobremesa é saudável com base nas calorias, e delicious? sempre retorna true (todas as sobremesas são deliciosas por padrão).

```Classe JellyBean```: A classe JellyBean herda de Dessert e adiciona o atributo ```flavor```. Ela sobrescreve o método ```delicious?``` para retornar false se o sabor for ```"black licorice"```, mas, caso contrário, chama o método da classe pai para retornar true, em alternativa acho que seria possivel usar um módulo para adicionar funcionalidades como healthy? e delicious? à classe JellyBean.
exemplos de uso
```
a=Dessert.new("sorvete", 150)
puts a.healthy? saida seria True pois so retorna false se o segundo argumento da instancia for maior ou igual a 200
puts a.delicious?Saida sera True por padrao
b=JellyBean.new("jelly",300,"black licorice")
puts b.healthy?Retornara falsa pois 300 esta acima de 200
puts b.delicious?e False pois o saber "black licorice" aparentemente nao seria delicioso...
```
# Resolução do Exercício: Implementação do attr_with_history 
O objetivo deste exercício é criar um método chamado attr_accessor_with_history, que adiciona um getter e setter para um atributo de uma classe e, além disso, mantém um histórico de todas as alterações feitas nesse atributo.
```Ruby
# Adicionando um novo método à classe `Class` para criar acessores personalizados com histórico
class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s  # Converte o nome do atributo para string
    
    # Criação dos getters dinamicamente
    attr_reader attr_name
    attr_reader "#{attr_name}_history"

    # Usando class_eval para definir os métodos dentro da classe
    class_eval %Q{
      def initialize
        @#{attr_name} = nil  # Inicializa o atributo com valor nil
        @#{attr_name}_history = [nil]  # Inicializa o histórico com nil
      end

      def #{attr_name}=(value)
        @#{attr_name}_history << value  # Adiciona o novo valor ao histórico
        @#{attr_name} = value  # Atribui o valor ao atributo
      end
    }
  end
end

# Definindo uma classe `Foo` e utilizando o novo método para criar o atributo `bar`
    class Foo
      attr_accessor_with_history(:bar)
    end

# Criando uma instância de `Foo` e testando o atributo `bar`
    product = Foo.new
    product.bar = 1
    product.bar = 2
    product.bar = 3
    puts product.bar_history.inspect  # Saída: [nil, 1, 2, 3]
```
A modificação da classe Class é feita para que todas as classes em Ruby possam usar o método ```attr_accessor_with_history```. Esse método cria um getter e um setter para o atributo especificado, além de manter um histórico de todas as mudanças.O argumento ```attr_name``` é convertido para uma string com ```to_s```, para facilitar o uso de interpolação de string e garantir que o nome do atributo seja tratado de forma consistente, attr_reader para criar os métodos de leitura do atributo e do histórico.
O ```class_eval``` é utilizado para definir o método ```initialize``` em tempo de execucao (que inicializa os valores de instância do atributo e o histórico) e o método setter (que armazena os valores e mantém o histórico).
O initialize cria duas variáveis de instância:
   ```
    @#{attr_name}: Armazena o valor atual do atributo (inicialmente nil).
    @#{attr_name}_history: Um array que armazena o histórico das alterações no atributo (começando com o valor nil).
```
O setter recebe um novo valor e o adiciona ao histórico ```(@#{attr_name}_history)```, além de definir o valor atual do atributo ```(@#{attr_name})```.
# Metaprogramação com class_eval:
Usando ```class_eval``` para adicionar dinamicamente métodos à classe onde o ```attr_accessor_with_history``` é chamado. Essa técnica permite uma grande flexibilidade, pois pode gerar métodos de forma programática, o histórico é armazenado como um array, onde os valores atribuídos ao atributo são empilhados ao longo do tempo. Isso é útil para garantir que todas as mudanças do atributo sejam registradas e possam ser acessadas.
Uma alternativa talvez seria criar um módulo que pudesse ser incluído nas classes para adicionar esse comportamento de histórico de forma não invasiva. Isso evitaria a alteração da classe Class diretamente, o que pode ser problemático em alguns cenários.
```Ruby
module WithHistory
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s
    attr_reader attr_name
    attr_reader "#{attr_name}_history"
    
    define_method("#{attr_name}=") do |value|
      instance_variable_set("@#{attr_name}_history", instance_variable_get("@#{attr_name}_history") + [value])
      instance_variable_set("@#{attr_name}", value)
    end
  end
end

class Foo
  extend WithHistory
  attr_accessor_with_history(:bar)
end
```
A implementação inicial com ```class_eval``` é relativamente simples, mas o uso de metaprogramação e a criação de getters/setters dinamicamente pode ser confuso. Usar attr_reader e a criação de métodos via class_eval pode exigir um conhecimento mais avançado da linguagem..

# A utilização de LLMs no desenvolvimento de aplicações Ruby 
Alem oferece diversas vantagens, principalmente no aprendizado, resolução de problemas e análise crítica do código. Durante a execução dos exercícios do Homework 01, foi possível perceber como a LLM pode auxiliar na explicação de conceitos, sugerir alternativas e otimizar o desenvolvimento, : Com o auxílio da LLM que foi usada como O CHAT GPT, o tempo de desenvolvimento foi reduzido, principalmente pela rapidez em obter explicações e alternativas de código, o esforço para entender os problemas e as soluções foi significativamente diminuído, uma vez que a LLM forneceu explicações claras e detalhadas sobre cada exercício, uma vez que apenas lendo o enunciado, pelo menos para mim nao ficou claro de imediato o que estava sendo pedido, ainda mais a proposta dos exercicios estarem puramente em ingles, que seria algo que ainda estou aprendendo, entao alem da LMM o uso do google tradutor tambem foi bem vindo. No entanto o uso de Large Language Models (LLMs), como o ChatGPT, tem se mostrado uma ferramenta poderosa e eficiente para o aprendizado e desenvolvimento de aplicações em Ruby, especialmente ao abordar conceitos complexos e explicar e resolver problemas de programação. No entanto, apesar das vantagens consideráveis, é importante também refletir sobre os desafios e limitações desse tipo de ferramenta no contexto do aprendizado prático e da implementação de soluções robustas em Ruby. A principal vantagem observada ao utilizar LLMs foi a agilidade no processo de aprendizado. Com explicações claras e diretas sobre conceitos e funções específicas do Ruby, o tempo necessário para compreender o funcionamento de certas estruturas (como módulos, mixins, e exceções personalizadas) foi consideravelmente reduzido. Isso também pode ser atribuído à capacidade da LLM de oferecer explicações sobre como funcionam as funções internas do Ruby e sugerir alternativas de implementação com base em boas práticas de programação.A LLM foi extremamente útil na resolução de problemas práticos, como a implementação de validações de entrada (com exceções personalizadas) e o uso de coleções, como o group_by para agrupar anagramas. A assistência imediata para encontrar falhas de lógica ou fornecer alternativas mais eficientes permitiu que o foco fosse mais direcionado à exploração de soluções criativas e ao aprendizado de novas funcionalidades do Ruby. 

O suporte para entender os erros no código e a explicação das mensagens de erro também foi um ponto positivo. Isso ajudou a reduzir a frustração comum de quem está aprendendo Ruby, além de acelerar o processo de depuração e validação do código. No entanto um dos principais riscos ao usar LLMs durante o aprendizado é a possibilidade de dependência excessiva. Como as respostas da LLM são rápidas e diretas, pode-se cair na armadilha de não buscar uma compreensão mais profunda dos conceitos, deixar de lado a leitura da documentacao por assim dizer ou até mesmo de não tentar resolver os problemas sozinho, isso pode afetar negativamente o desenvolvimento de habilidades de resolução de problemas de forma independente, que é crucial para o aprendizado de programação. Apesar de a LLM oferecer explicações claras, em alguns casos, ela pode não fornecer uma compreensão completa do problema ou da solução proposta. Em situações mais complexas, como na implementação de exceções personalizadas e lógica de jogo, a explicação fornecida pela LLM não substitui completamente o esforço de exploração manual e o estudo mais profundo do funcionamento de Ruby em contextos mais avançados.
Para evitar a dependência excessiva da LLM, seria interessante combinar o uso de LLMs com exercícios práticos e desafiadores onde o aluno deve tentar resolver os problemas de forma independente primeiro, usando a LLM apenas para tirar dúvidas pontuais ou obter feedback sobre o progresso. Ao usar uma LLM, é fundamental que o aprendiz critique as respostas fornecidas, testando as soluções, verificando a eficiência e considerando alternativas por conta própria. Além disso, seria benéfico que o aprendizado fosse mais orientado a conceitos fundamentais, com a LLM sendo utilizada como uma ferramenta de apoio para expandir o conhecimento.

# Esforço: O Quão Difícil foi Compreender, Implementar e Analisar as Soluções..
Facilidade na Compreensão de Conceitos , como programação orientada a objetos (OOP) e manipulação de coleções, a LLM desempenhou um papel importante em simplificar a explicação de como essas estruturas funcionam em Ruby. Isso reduziu o esforço cognitivo necessário para entender a teoria por trás de cada exercício e focar mais na implementação prática.
Exemplo: Para o exercício de herança e sobrecarga de métodos com a classe JellyBean (que herda de Dessert), a LLM explicou claramente como os métodos da classe base podem ser sobrescritos e como isso impacta a lógica de deliciosidade do objeto.
Resolução de Problemas e Criatividade: Embora a LLM tenha sugerido soluções rápidas e alternativas, o esforço criativo ainda foi necessário para personalizar as soluções para os problemas específicos do exercício. Isso inclui adaptar a lógica fornecida pela LLM para atender aos casos de borda, como validação de entrada e verificação de erros.

Exemplo: No caso de rps_tournament_winner, a LLM forneceu um esboço básico para o jogo, mas o esforço do programador e necessário para incorporar a validação de entrada, gerenciamento de exceções e lógica de torneio.
Desenvolvimento e Análise de Alternativas: A LLM ajudou a reduzir o esforço necessário para pensar em alternativas para o código. Em alguns casos, as alternativas oferecidas pela LLM eram muito eficientes, mas em outros, as soluções poderiam ser otimizadas ainda mais. Avaliar essas alternativas exigiu um certo esforço para entender as implicações de cada abordagem.

Exemplo: O exercício de anagramas foi resolvido com o uso de group_by; no entanto, o programador teve que refletir sobre as vantagens e desvantagens de usar o método sort para ordenar os caracteres de cada palavra, em termos de complexidade e legibilidade.
Necessidade de Exploração Profunda: Em algumas situações, como quando se discutiu o uso de exceções personalizadas ou gerenciamento de erros no código de torneios, a LLM forneceu explicações básicas e diretas, mas a exploração mais profunda do conceito (por exemplo, aprender mais sobre o ciclo de vida das exceções em Ruby) exigiu um esforço extra do programador. Embora a LLM fornecesse explicações instantâneas, a absorção profunda do conceito requer uma análise mais detalhada e prática contínua.

 Sem a LLM, a abordagem tradicional envolveria pesquisar mais na documentação, consultar fóruns de programação, e tentar compreender o código por conta própria, o que exigiria mais tempo e esforço. A LLM economiza esse tempo ao fornecer informações diretamente relacionadas ao problema, mas o esforço de aplicar o conceito e avaliar as implicações das soluções ainda é necessário.

Efeito de Longo Prazo no Esforço: A longo prazo, o uso contínuo de LLMs pode reduzir o esforço em tarefas repetitivas ou na resolução de problemas comuns. No entanto, a dependência excessiva da LLM pode comprometer a capacidade do desenvolvedor de resolver problemas de forma independente, já que as soluções são fornecidas sem um aprofundamento nos conceitos fundamentais.

Conclusão sobre Tempo e Esforço
Tempo: A LLM definitivamente acelera o processo de aprendizado e resolução de problemas em Ruby, proporcionando respostas rápidas, explicações claras e sugestões de implementação. A redução de tempo pode ser significativa, permitindo a conclusão dos exercícios em menos tempo e com maior eficiência.

Esforço: Embora a LLM facilite o entendimento de conceitos e a resolução de problemas, ela também exige esforço cognitivo para aplicar corretamente as soluções sugeridas e avaliar alternativas. Além disso, o aprendizado de conceitos avançados e a compreensão profunda da linguagem continuam exigindo esforço significativo.

No geral, o uso de LLMs pode diminuir o esforço de aprendizado e aumentar a produtividade em tarefas repetitivas, mas o desenvolvedor precisa se equilibrar para não depender demais da ferramenta, garantindo o desenvolvimento de habilidades sólidas e a compreensão completa dos conceitos fundamentais.

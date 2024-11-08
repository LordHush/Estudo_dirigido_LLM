# Classe sem herdar de Exception ou StandardError
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
  
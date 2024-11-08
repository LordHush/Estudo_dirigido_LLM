class Class
    def attr_accessor_with_history(attr_name)
      attr_name = attr_name.to_s  # Converte o nome do atributo para string
      
      # Criação dos getters dinamicamente
      attr_reader attr_name
      attr_reader "#{attr_name}_history"
  
      # Executa class_eval dentro do contexto da classe que chamou
      class_eval %Q{
        def initialize
          @#{attr_name} = nil
          @#{attr_name}_history = [nil]
        end
  
        def #{attr_name}=(value)
          @#{attr_name}_history << value
          @#{attr_name} = value
        end
  
      }
    end
  end
  
  # Definindo a classe `foo` e chamando `attr_accessor_with_history(:bar)`
  class Foo
    attr_accessor_with_history(:bar)
  end
  
  # Criando uma instância da classe `Foo`
  product = Foo.new
  product.bar=1
  product.bar=1
  product.bar=1
  puts product.bar_history.inspect
 

  
  
  
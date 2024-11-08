def palindrome?(string)
    str_formated=string.gsub(/[^a-z0-9]/i,"")
    if str_formated.downcase == str_formated.downcase.reverse
        true
    else
        false
    end
    
end

class String
    # Definindo o método palindrome?
    def palindrome?
      # Compara a string com ela mesma invertida
      self == self.reverse
    end
  end
module Enumerable
    def palindrome?
        if self == self.reverse
            true
        else 
            false
            
        end
    end
    
end

puts [5,2,3,2,1].palindrome?
puts "foo".palindrome?
puts palindrome?("cars")

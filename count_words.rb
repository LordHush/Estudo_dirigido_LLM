def count_words(string)
    str_formated=string.gsub(/[^a-z0-9]/i," ").downcase.split(" ")
    hash={}
    str_formated.each{
        |string| 
        hash[string]=str_formated.count(string)
    }
    puts hash
end
count_words("Doo bee doo bee doo")

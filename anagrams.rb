def combine_anagrams(words)
    # Passo 1: Criar pares [palavra_ordenada, palavra_original]
    x=words.group_by{|word| word.chars.sort.join}
    puts x.values.inspect
end
  
  # Teste
  combine_anagrams(['cars', 'for', 'potatoes', 'racs', 'four', 'scar', 'creams', 'scream'])
  
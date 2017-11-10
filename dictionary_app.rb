require "unirest"

while true
  system "clear"
  puts "Welcome to the Dictionary app"
  print "Please enter a word you would like defined: "
  input_word = gets.chomp

  response_definition = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{input_word}/definitions?limit=200&includeRelated=true&useCanonical=false&includeTags=false&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")

  definition_body = response_definition.body
  definition = definition_body[0]["text"]
  puts "\nDefinition: #{definition}"

  response_top_example = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{input_word}/topExample?useCanonical=false&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")

  top_example_body = response_top_example.body
  example = top_example_body["text"]
  puts "\nExample: #{example}"

  repsonse_pronunciation = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{input_word}/pronunciations?useCanonical=false&limit=50&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")

  pronunciation_body = repsonse_pronunciation.body
  pronunciation = pronunciation_body[0]["raw"]
  puts "\nPronounced: #{pronunciation}"
  
  puts "\nPress any key to continue, or q to quit"
  action = gets.chomp
  if action == "q"
    break
  end
end

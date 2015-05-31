
word_to_guess = File.readlines('words.txt').map { |word| word.strip }.sample

# Hangman Pseudocode
# Display the word to the user (with underscores for each letter not guessed)

word_to_display = word_to_guess.chars.map { |character| "_" }.join(" ")

puts "Word to guess: #{word_to_display}"

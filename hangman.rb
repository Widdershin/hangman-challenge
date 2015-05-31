# Hangman Pseudocode
# Make an empty array to keep track of successful guesses
#
# Loop
#   Display the word to the user (with underscores for each letter not guessed)
#   Ask the user to guess a letter
#
#   If the letter guessed is in the word to guess
#     Add the guess to the list of successful guesses


word_to_guess = File.readlines('words.txt').map { |word| word.strip }.sample
letters_successfully_guessed = []

loop do

  word_to_display = word_to_guess.chars.map do |character|
    if letters_successfully_guessed.include? character
      character
    else
      "_"
    end
  end.join(" ")

  puts "Word to guess: #{word_to_display}"

  puts "Guess a letter:"

  letter_guessed = gets.strip

  if word_to_guess.include? letter_guessed
    letters_successfully_guessed << letter_guessed
  end
end

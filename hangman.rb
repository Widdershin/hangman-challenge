# Hangman Pseudocode
# Make an empty array to keep track of successful guesses
# Start with 7 lives remaining
#
# Loop
#   Display the word to the user (with underscores for each letter not guessed)
#   Display the number of lives remaining
#   Ask the user to guess a letter
#
#   If the letter guessed is in the word to guess
#     Add the guess to the list of successful guesses
#   else
#     lose a life


word_to_guess = File.readlines('words.txt').map { |word| word.strip }.sample
letters_successfully_guessed = []
lives_remaining = 7

loop do

  word_to_display = word_to_guess.chars.map do |character|
    if letters_successfully_guessed.include? character
      character
    else
      "_"
    end
  end.join(" ")

  puts "Lives remaining: #{lives_remaining}"
  puts "Word to guess: #{word_to_display}"

  puts "Guess a letter:"

  letter_guessed = gets.strip

  if word_to_guess.include? letter_guessed
    letters_successfully_guessed << letter_guessed
  else
    lives_remaining -= 1
  end
end

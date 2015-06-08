require_relative 'art'

puts `clear`

word_to_guess = File.readlines('words.txt').map { |word| word.strip }.sample
#puts word_to_guess

correct_guesses = []

incorrect_guesses = []

counter = 0

loop {

	word_status_display = word_to_guess.chars.collect do |letter|
		(correct_guesses.include? letter) ? letter : "_"
	end.join(" ")

	#Lives
	puts "You have used #{counter} of your 7 lives"
	puts ART[counter]

	#Input request
	puts "Pick a letter!"
	
	puts word_status_display
	
	letter_guess = gets.chomp.downcase

	puts `clear`
	
	#Conditions for scoring or incorrect input	
	if letter_guess =~ /^[0-9]/ || /[[:punct:]]/  
		puts "#{letter_guess} is not a letter!"
	elsif letter_guess.empty?  
		puts "Letter please!"
	elsif letter_guess.length > 1  
		puts "Oops! that's more than one letter"
	elsif (correct_guesses.include? letter_guess) || (incorrect_guesses.include? letter_guess)  
		puts "Don't repeat letters!"
	elsif word_to_guess.include? letter_guess  
		puts "OMG yay!"; correct_guesses << letter_guess
	else counter += 1; puts "Bummer :("; incorrect_guesses << letter_guess
	end

	#Winning or losing statements
	break puts "#{ART[counter]}\nHA HA you're dead! The word was #{word_to_guess}" if (counter == 7)
	break puts "#{ART[counter]}\nWoohoo! You have successfully avoided a public execution" if (correct_guesses.length == word_to_guess.chars.uniq.length)

}




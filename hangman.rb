art = [
  <<-ART ,
/----
|   |
|
|
|
|
--------
  ART
  <<-ART ,
/----
|   |
|   O
|
|
|
--------
  ART
  <<-ART ,
/----
|   |
|   O
|   |
|
|
--------
  ART
  <<-ART ,
/----
|   |
|   O
|  /|
|
|
--------
  ART
  <<-ART ,
/----
|   |
|   O
|  /|\\
|
|
--------
  ART
  <<-ART ,
/----
|   |
|   O
|  /|\\
|  /
|
--------
  ART
  <<-ART ,
/----
|   |
|   O
|  /|\\
|  / \\
|
--------
  ART
]

word_to_guess = File.readlines('words.txt').map { |word| word.strip }.sample
puts word_to_guess

correct_guesses = []

counter = 0

loop {

	word_status_display = word_to_guess.chars.collect do |letter|
		(correct_guesses.include? letter) ? letter : "_"
	end.join(" ")

	puts "Pick a letter!"
	
	puts word_status_display
	
	letter_guess = gets.chomp.downcase

	puts `clear`
	
	(word_to_guess.include? letter_guess) ? (puts "OMG yay!"; correct_guesses << letter_guess) : (counter += 1; puts "Bummer :(")
	
	puts "You have used #{counter} of your 7 lives"
	puts art[counter]

	break puts "HA HA you're dead" if (counter == 7)
	break puts "Woohoo! You have successfully avoided a public execution" if (correct_guesses.length == word_to_guess.chars.uniq.length) 

}




class Word < String             # Word inherits from String.
# Returns true if the string is its own reverse.

	def palindrome?
		self == self.reverse        # self is the string itself.
 	end

 	#Creates palindrome from word by attaching reverse of same word
	def create_palindrome
		Word.new("#{self}#{self.reverse}")
	end
end
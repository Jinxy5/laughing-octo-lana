class String

	def is_all_uppercase?
		self == self.upcase 	
	end

	def is_all_lowercase?
 		self == self.downcase
 	end

 	def assimilate(outstring)
 		template = self.chars[0..outstring.length - 1]

 		template.each_with_index do |char, index|
			char.is_all_uppercase? ? outstring[index] = outstring[index].upcase : outstring[index] = outstring[index].downcase
 		end

 		outstring
 	end


end
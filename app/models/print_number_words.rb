class PrintNumberWords 


	# def initialize(a)
 #    #@number = "1234567892"
 #    @number = a
 #  end

  def self.get_strings_from_number(number)
  	digit_letters = {"2" => ['A','B','C'],"3" => ['D','E','F'],"4" => ['G','H','I'],"5" => ['J','K','L'],
  	  	 									"6" => ['M','N','O'],"7" => ['P','Q','R','S'],"8" => ['T','U','V'],"9" => ['W','X','Y','Z']}

    dictionary = []
    file_path = Rails.root.join("dictionary.txt")
    File.foreach( file_path ) do |word|
      dictionary.push word.chop.to_s
    end
    
    puts number
    number_array = number.split('')
    number_letters = number_array.map{|digit|digit_letters[digit]}
    combination_string = printcombinations(number_letters)
    combination_string = combination_string.select {|word| word.length >=3}
    return combination_string ,(combination_string & dictionary)
  end


  def self.printcombinations(number_letters)
	   string, words = [] ,[]
	    if number_letters.present?
	      number_letters.each do |letters|
	        if words.blank?
	          words = letters
	        else
	          string = words.dup
	          words = words.product(letters).map(&:join)
	          words.flatten!
	          words << string
	          words.flatten!
	        end
	      end
	    end
    return words
  end

end

# a= PrintNumberwords.new()
# a.get_numbers(1234567892)




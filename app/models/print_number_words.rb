class PrintNumberWords 


	# def initialize(a)
 #    #@number = "1234567892"
 #    @number = a
 #  end

  def self.get_strings_from_number(number)
  	digit_letters = {"2" => ['A','B','C'],"3" => ['D','E','F'],"4" => ['G','H','I'],"5" => ['J','K','L'],  	 									"6" => ['M','N','O'],"7" => ['P','Q','R','S'],"8" => ['T','U','V'],"9" => ['W','X','Y','Z']}

    dictionary = []
    file_path = Rails.root.join("dictionary.txt")
    File.foreach( file_path ) do |word|
      dictionary.push word.to_s
    end
    
    puts number
    number_array = number.split('')
    number_letters = number_array.map{|digit|digit_letters[digit]}
    printcombinations(number_array,number_letters, dictionary)
   #  #words = keys.shift.product(*keys).map(&:join).reverse
   #  words = product_of_array(keys)
  end


  def self.printcombinations(number_array ,number_letters, dictionary)
  	debugger
  end

end

# a= PrintNumberwords.new()
# a.get_numbers(1234567892)




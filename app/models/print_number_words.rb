class PrintNumberWords

  def self.get_strings_from_number(number)
    digit_letters =  {"2" => ['A','B','C'],"3" => ['D','E','F'],"4" => ['G','H','I'],"5" => ['J','K','L'],
  	  	 						"6" => ['M','N','O'],"7" => ['P','Q','R','S'],"8" => ['T','U','V'],"9" => ['W','X','Y','Z']}

    dictionary = []
    file_path = Rails.root.join("db","dictionary.txt")
    File.foreach( file_path ) do |word|
      dictionary.push word.chop.to_s
    end
    get_strings = []
    words = number.chars.map{|digit|digit_letters[digit]}

    matches = {}
    total = words.length - 1
    
    for i in (2..total)
      array1 = words[0..i]
      array2 = words[i + 1..total]
      if !(array1.length < 3 || array2.length < 3)
      	combination_first = array1.shift.product(*array1).map(&:join)
      	combination_last = array2.shift.product(*array2).map(&:join) 
      	matches[i] =  [(combination_first & dictionary), (combination_last & dictionary)] 
      end
    end  

    matches.each do |key, array|
     unless (array.first.blank? || array.last.blank?)
	      array.first.product(array.last).each do |words|
	        get_strings << words
	      end
    	end
    end


     get_strings << (words.shift.product(*words).map(&:join) & dictionary).join(", ")

    
    get_strings
  end

end
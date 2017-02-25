class AssignmentsController < ApplicationController

	def index
		@error_message, @word_combinations = nil,nil
	  if params[:number].present? && params[:number].length != 10
	  	  @error_message =  "Enter 10 digit number between 2 to 9 "
	  	return @error_message   
	  elsif params[:number].present? && params[:number].split("").select{|a| a.to_i == 0 || a.to_i ==1}.length >0
	  	 @error_message =  "Number should be between 2 to 9"
	  	return @error_message 
    else
	 		@word_combinations = PrintNumberWords.get_strings_from_number(params[:number]) if params[:number]	
    end
   return @word_combinations
	end

end

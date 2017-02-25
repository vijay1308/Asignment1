class AssignmentsController < ApplicationController

	def index
		@error_message = nil
	  if params[:number].present? && params[:number].length != 10
	  	  @error_message =  "Enter 10 digit number between 2 to 9 "
	  	return @error_message   
	  elsif params[:number].present? && params[:number].split("").select{|a| a.to_i == 0 || a.to_i ==1}.length >0
	  	 @error_message =  "Number should be between 2 to 9"
	  	return @error_message 
    else
	 		@print_numbers = PrintNumberWords.get_strings_from_number(params[:number]) if params[:number]	
    	return @print_numbers
    end

	end

end

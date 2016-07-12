require 'rest-client'

MAX_DISTANCE = 2

class MainController < ApplicationController
	def index
	end

	def results

    def words text
			text.downcase.scan(/[a-z]+/)
		end

    word_array = words(File.new("#{Rails.root}/public/usa.txt").read)
    search = params[:q].downcase
    narrowed_array = []

    word_array.each do |i|
	 		if search[0...2] == i[0...2]
	 		narrowed_array << i
	 		end
	 	end
 
		def edit_distance (to, from, score)
		  if score > MAX_DISTANCE
		  	return 0
		  end
  
		  return from.length if to.empty?		  
		  return to.length if from.empty?
		  
		  add = 1 + edit_distance(from, to[1..-1], score + 1)  		  
		  remove = 1 + edit_distance(from[1..-1], to, score + 1)
		  additional_cost = (from[0] == to[0] ? 0 : 1)
		  edit = edit_distance(from[1..-1], to[1..-1], score + additional_cost) + additional_cost
		  	  
		  return [add, remove, edit].min		  
		end

		def binary_search(array, key, low=0, high=array.size-1)  
		  return -1 if low > high  
		  mid = (low + high) / 2  
		  return mid if array[mid]==key  
		  if array[mid] > key  
		    high = mid - 1  
		  else  
		    low = mid + 1  
		  end  
		  binary_search(array, key, low, high)   
		end
		@corrections = []

    if binary_search(narrowed_array, search) > -1
    	@results = search
    else
			puts "olivias going to NY"
	 		narrowed_array.each do |i|
	 			if edit_distance(search, i, 0) < MAX_DISTANCE
	 			puts i
	 			@corrections << i
	 			end
	 		end
	  end
	end
end

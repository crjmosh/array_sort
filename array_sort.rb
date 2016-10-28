require 'pry'
require 'babbler'

puts Babbler.babble
binding.pry

def main_menu()
	puts "Enter numbers for your array:"
	numbers = gets.strip
	@num_array = numbers.split(/[^-\d+$]/)
	@num_array.reject!(&:empty?)
	@num_array = @num_array.map(&:to_i)
	choose()
end

def choose()
	puts "1. Find highest number"
	puts "2. Find lowest number"
	puts "3. Enter new array"
	choice = gets.strip
	exit if choice == "quit"
	case choice
	when "1"
		highest_number()
	when "2"
		lowest_number()
	when "3"
		main_menu()
	else
		puts "Invalid choice"
		choose()
	end
end

def highest_number()
	@num_array.each do |num|
		compare = 0
		while compare < @num_array.length
			if num >= @num_array[compare]
				if compare >= (@num_array.length - 1)
					puts "#{num} is the highest."
				end
			else
				compare += @num_array.length
			end
			compare += 1
		end
	end
	choose()
end

def lowest_number()
	@num_array.each do |num|
		compare = 0
		while compare < @num_array.length
			if num <= @num_array[compare]
				if compare >= (@num_array.length - 1)
					puts "#{num} is the lowest."
				end
			else
				compare += @num_array.length
			end
			compare += 1
		end
	end
	choose()
end

while true
	main_menu()
end
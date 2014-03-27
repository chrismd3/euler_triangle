#!/usr/bin/env ruby

def read_triangle(file_name)
	output = []
	File.readlines(file_name).each do |line|
		line_array = line.split(' ').map(&:to_i)
		output << line_array
	end
	output
end

def solve_triangle(triangle_array)
	last_line = triangle_array.pop
	triangle_array.reverse_each do |current_line|
		index = 0
		current_line.map! do |num|
			num += [last_line[index],last_line[index+1]].max
			index += 1
			num
		end
		last_line = current_line
	end
	last_line[0]
end

triangle_array = read_triangle('triangle_input.txt')

puts solve_triangle(triangle_array)
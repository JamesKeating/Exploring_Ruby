require_relative "bubble_sort"
require_relative "utility"

def get_file_name
  puts "Please enter the name of the file to open (hint: use 'test'): "
  gets.chomp
end

def sort_values_in_file(filename)
  data = Utility.read_file(filename)
  data.each_char.map { |c| Integer(c) }
end

def main
  int_array = sort_values_in_file(get_file_name)
  puts "The original array of numbers was: #{int_array}"

  sorted_array = BubbleSort.sort(int_array)
  puts "The sorted array is: #{sorted_array}"
end

main
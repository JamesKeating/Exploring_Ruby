require_relative "utility"

class BubbleSort

  def self.sort(int_array)

    int_array.each do |i|
      number_of_swaps = 0

      (int_array.length - 1).times do |j|
        if int_array[j] > int_array[j+1]
          Utility.swap(int_array, j, j+1)
          number_of_swaps += 1
        end
      end

      if number_of_swaps == 0
        break
      end

    end

    return int_array

  end

end
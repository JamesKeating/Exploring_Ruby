class Utility

  def self.swap(array, index1, index2)
    temp = array[index2]
    array[index2] = array[index1]
    array[index1] = temp

    return array
  end

  def self.read_file(file_name)
    file = File.open(file_name, "r")
    data = file.read
    file.close
    return data
  end
end
#Question 2
class FamilyMember

  attr_accessor :name, :sex, :status, :age, :has_children

  def initialize(name, sex, status, age, has_children)
    @name = name
    @sex = sex
    @status = status
    @age = age
    @has_children = has_children
  end

  def parent?
    unless has_children
      p "The family member #{@name} is NOT a parent"
      return false
    end

    if sex.upper == "MALE"
      p "The family member #{@name} is a Father"
    else
      p "The family member #{@name} is a Mother"
    end

    true
  end

  def child?
    unless @age < 18
      p "The family member #{@name} is NOT a child"
      return false
    end

    if sex.upper == "MALE"
      p "The family member #{@name} is a child/son"
    else
      p "The family member #{@name} is a child/daughter"
    end

    true
  end
end

fm1 = FamilyMember.new("Tom", "Male", "Married", 44, true)
fm2 = FamilyMember.new("Mary", "Female", "Married", 46, true)
fm3 = FamilyMember.new("Emma", "Female", "Underage", 16, false)
fm4 = FamilyMember.new("Bob", "Male", "Underage", 12, false)
fm5 = FamilyMember.new("Joe", "Male", "Underage", 9, false)

#Question 3
family_array = [fm1, fm2, fm3, fm4, fm5]

family_array.each do |i|
  puts i.status
end

#Question 4
family_array.each do |i|
  p i
end

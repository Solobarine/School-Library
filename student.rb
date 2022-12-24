require_relative './person'

class Student < Person
  def initialize(name, age, parent_permission, classroom)
    @classroom = classroom
    super(name, age)
  end

  def play_hooky
    return '¯\(ツ)/¯'
  end
end

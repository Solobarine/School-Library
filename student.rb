require_relative './person'

class Student < Person
  def initialize(*person, classroom)
    @classroom = classroom
    super(*person)
    classroom.students.push(self) if classroom.students.exclude?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end

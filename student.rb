require_relative './person'

class Student < Person
  def initialize(*person, classroom)
    @classroom = classroom
    super(*person)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end

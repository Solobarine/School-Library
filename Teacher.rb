require_relative 'Teacher.rb'
include Teacher

class Teacher < Person
  def initialize(name, age, parent_permission, specialization)
    @specialization = specialization
    super(name, age, parent_permission)
  end

  def can_use_services
    return true
  end
end

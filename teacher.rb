require_relative './person'

class Teacher < Person
  def initialize(name, age, parent_permission, specialization)
    @specialization = specialization
    super(name, age, parent_permission)
  end

  def can_use_services
    true
  end
end

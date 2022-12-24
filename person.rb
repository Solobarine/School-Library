require_relative './nameable'

class Person
  attr_accessor :id, :name, :age

  def initialize(name: 'Unknown', age, parent_permission: true)
    self.age = age
    self.name = name
    @parent_permission = parent_permission
    @id = Random.rand(1...100)
  end
 
  def correct_name
    @name
  end

  private

  def of_age?
    true if @age >= 18

    false
  end

  def can_use_services?
      true if @age >= 18 || @parent_permission == true

      false

  end
end

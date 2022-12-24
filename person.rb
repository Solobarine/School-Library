require_relative './nameable'

class Person
  def initialize(age, name = 'Unknown', parent_permission = true)
    self.age = age
    self.name = name
    @parent_permission = parent_permission
    @id = Random.rand(1...100)
  end

  attr_accessor :name, :age
  attr_reader :id

  def correct_name
    @name.to_s
  end

  private

  def of_age?
    true if @age >= 18

    false
  end

  public

  def can_use_services?
    true if @age >= 18 || @parent_permission == true

    false
  end
end

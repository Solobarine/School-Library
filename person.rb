require_relative './nameable'
require_relative './rental'

class Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    self.age = age
    self.name = name
    @parent_permission = parent_permission
    @id = Random.rand(1...100)
    @rentals = []
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
  
  def add_rental(book, date)
    Rental.new(date, book, self)
  end
end

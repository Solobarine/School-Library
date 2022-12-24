require_relative './nameable.rb'

class Base_Decorator < Nameable
  attr_accessor :nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

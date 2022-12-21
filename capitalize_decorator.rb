require_relative './base_decorator.rb'

class Capitalize_Decorator < Base_Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end


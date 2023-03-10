require_relative './base_decorator'

class TrimmerDecorator < Base_Decorator
  def correct_name
    if @nameable.correct_name.length <= 10
      @nameable.to_s
    else
      @nameable.correct_name[0..9].to_s
    end
  end
end

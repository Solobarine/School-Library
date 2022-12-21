class Person
  att_accessor :id, :name, :age
  def initialize(name='Unknown', age, parent_permission=false)
    self.age = age
    self.name = name
    @parent_permission = parent_permission
    @id = Random.rand(1...100)
  end

  private_class_method :is_of_age
    if (@age >= 18)
      return true
    else
      return false
    end
  end

  def can_use_services
      if (@age >= 18 && @parent_permission == true)
        return true
      else
        return false
      end
  end
end
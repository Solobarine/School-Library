class Person
  att_accessor :id, :name, :age
  def initialize(name='Unknown', age, parent_permission=false)
    self.age = age
    self.name = name
    @parent_permission = parent_permission
  end

  def setId=(id)
    :id = id
  end

  def getId
    return :id
  end

  def setName=(name)
    @name = name
  end

  def getName
    return @name
  end

  def getAge=(age)
    @age = age
  end

  def setAge
    return @age
  end

  def is_of_age
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

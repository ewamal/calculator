# class for creating user
class User
  def initialize(email, age, name)
    @email = email
    @age  = age
    @name = name
  end

  # def email
  #   @email
  # end
  #
  # def age
  #   @age
  # end
  #
  # def name
  #   @name
  # end
  #
  # def email=(value)
  #   @email = value
  # end
  attr_reader :age, :name
  attr_accessor :email
end

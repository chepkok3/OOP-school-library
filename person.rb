class Person
  def initialize(_name, _age, parent_permission: true)
    @id = Random.rand(1..1000)
    @name = 'Unknown'
    @age = 0
    @parent_permission = parent_permission
  end

  attr_accessor :id, :name, :age, :parent_permission

  private

  def of_age?
    @age >= 18
  end
end

require_relative 'nameable'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :parent_permission, :rentals

  def initialize(name, age, parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rental(date = Date.today, person = nil, book = self)
    @rentals << self unless @rentals.include?(self)
    Rental.new(date, person, book)
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end

  def correct_name
    @name
  end
end

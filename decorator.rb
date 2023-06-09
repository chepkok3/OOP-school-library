require_relative 'nameable'

class Decorator < Nameable
  attr_accessor :nameable

  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

class TrimmerDecorator < Decorator
  def correct_name
    original_name = @nameable.correct_name
    if original_name.length > 10
      original_name[0..9] # Trims to maximum of 10 characters
    else
      original_name
    end
  end
end

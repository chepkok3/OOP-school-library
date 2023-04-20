class Nameable
  def correct_name
    raise NotImplementedError, "#{self.class} Please implement the correct_name method '#{__method__}"
  end
end

class Duck

  def type
    "Type of #{self.class}"
  end

  def swim
    "#{self.class} is swimming!"
  end

  def fly
    raise NoMethodError, "Method Not Overriden"
  end

  def quack
    raise NoMethodError, "Method Not Overriden"
  end

end

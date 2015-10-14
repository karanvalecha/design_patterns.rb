class Screen

  attr_reader :position

  def initialize
    @position = :up
  end

  def up
    @position = :up
  end

  def down
    @position = :down
  end

end

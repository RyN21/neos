class Asteroid
  attr_reader :name

  def initialize(asteroid_data)
    @name = asteroid_data[:name]
  end
end

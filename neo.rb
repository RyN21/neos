require 'faraday'
require 'figaro'
require './asteroid'
require 'pry'
# Load ENV vars via Figaro
Figaro.application = Figaro::Application.new(environment: 'production', path: File.expand_path('../config/application.yml', __FILE__))
Figaro.load

asteroids_list_data = NeoService.new.all_asteroids_data

asteroids = asteroids_list_data.map do |asteroid_attributes|
  Asteriod.new(asteroid_attributes)
end

asteroids.each do |asteroid|
  
end

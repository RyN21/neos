require 'faraday'
require 'figaro'
require 'pry'
# Load ENV vars via Figaro
Figaro.application = Figaro::Application.new(environment: 'production', path: File.expand_path('../config/application.yml', __FILE__))
Figaro.load

class NeoService
  def all_asteroids_data
  #   get_json('/neo/rest/v1/feed')
  # end
  #
  # def get_json(path)
  #   url = "https://api.nasa.gov"
  #   response = Faraday.get(url)
  #   JSON.parse(response.body)
  # end

  def all_asteroids_data
    conn = Faraday.new(
      url: 'https://api.nasa.gov',
      params: { start_date: date, api_key: ENV['nasa_api_key']}
    )
    asteroids_list_data = conn.get('/neo/rest/v1/feed')
    parsed_asteroids_data = JSON.parse(asteroids_list_data.body, symbolize_names: true)[:near_earth_objects][:"#{date}"]
  end
end

class CitiesController < ApplicationController
  def index
    @cities = City.all
    puts "$" * 60
    puts "Voici le nombre de villes dans la base : #{@cities.length}"
    puts "$" * 60
  end

  def show
    @city_hash = get_city_hash
  end

  private

  def get_city_hash
    @city_hash = { "city" => nil, "index" => -1 }
    city_id = params[:id].to_i
    city = nil
    puts "$" * 60
    puts "city_id : #{city_id}"
    nb_total = City.last.id
    if city_id.between?(1, nb_total)
      city = City.find_by(id: city_id)
    end
    @city_hash = { "city" => city, "index" => city_id }
    puts "city_hash : #{@city_hash}"
    puts "$" * 60
    @city_hash 
  end
end

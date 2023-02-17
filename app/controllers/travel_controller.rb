class TravelController < ApplicationController
  def index
  @us = 2
  @u = "this is newbranch2 as a branch from newbranch"
  end
  def search
  countries = find_country(params[:country])

  unless countries



    flash[:alert] = "Country not found"
    render action: :index
  end

  @country = countries.first
  @weather = find_weather(@country['capital'], @country['alpha2code'])
  end

  # app/controllers/travel_controller.rb
  def find_weather(city, country_code)
    query = URI.encode("#{city},#{country_code}")

    request_api(
      "https://community-open-weather-map.p.rapidapi.com/forecast?q=#{query}"
    )
  end

  private
  def request_api(url)
    response = Excon.get(
      url,
      headers: {
        'X-RapidAPI-Host' => URI.parse(url).host,
        'X-RapidAPI-Key' => ENV.fetch('47bb193531msha1428a6fe199391p11fa34jsn62b53cde4dce')
      }
    )
     return nil if response.status !=200
     JSON.parse(response.body)
  end

  def find_country(name)
    request_api(
      "https://restcountries-v1.p.rapidapi.com/name/#{URI.encode(name)}"
    )

  end

end

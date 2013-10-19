require 'httparty'
require 'open-uri'
require 'json'

# Class to get movie poster information
## Successful returns for search_movie()
  ## => title
  ## => image
  ## => backdrop
## Successful returns for movie_image_config
  ## => base_url
  ## => size

class MoviePosterFinder

  MOVIE_URL = 'http://api.themoviedb.org/3/search/movie?api_key='
  CONFIG_URL = 'http://api.themoviedb.org/3/configuration?api_key='

  def initialize(api_key = 'nokey')
    @api_key = api_key
  end

  def search_movie(query)
    query = URI::encode(query)
    response = HTTParty.get(full_path(query), :headers => headers)
    results = JSON.parse(response.body)['results']
    foramtted_(results)
  end

  def movie_image_config
    response = HTTParty.get(full_path(:config), :headers => headers)
    results = JSON.parse(response.body)['images']
    {
      base_url: results['base_url'],
      size: results['poster_sizes'].last #(Only grabbing one here)
    }
  end

private

  def full_path(req = nil)
    return movie_url_query if req.nil?
    return config_url_query if config_req?(req)
    movie_url_query(req)
  end

  def headers
    {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }
  end

  def movie_url_query(query = '')
    MOVIE_URL + @api_key + "&query=#{query}"
  end

  def config_url_query
    CONFIG_URL + @api_key
  end

  def config_req?(req)
    return true if req == :config
  end

  def foramtted_(results)
    return unless results
    formatted = results.map do |r|
      unless r.nil?
        {
          title: r['title'],
          image: r['poster_path'],
          backdrop: r['backdrop_path']
        }
      end
    end
    formatted.delete_if {|x| x.nil?}
  end

end

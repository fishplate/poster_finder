require 'httparty'
require 'open-uri'
require 'json'

# Class to get music cover information
class MusicCoverFinder
  ALBUM_URL = "https://itunes.apple.com/search?term="

  def music_search(query)
    query = URI::encode(query)
    response = HTTParty.get(full_path(query), :headers => headers)
    results = JSON.parse(response.body)["results"]
    formatted_(results)
  end

  private

  def full_path(query)
    ALBUM_URL + "#{query}" + "&entity=album"
  end

  def headers
    {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }
  end

  def formatted_(results)
    return unless results
    formatted = results.map do |r|
      unless r.nil?
        {
          artist: r['artistName'],
          collection: r['collectionName'],
          image: r['artworkUrl100']
        }
      end
    end
    formatted.delete_if {|x| x.nil?}
  end
end

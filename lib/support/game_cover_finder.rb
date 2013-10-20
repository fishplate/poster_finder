require 'httparty'
require 'open-uri'
require 'json'

# Class that calls on thegamesdb API with a search query and returns
# cover and fan art for any games that match the query.
# 
# Example of usage:
# # The following line will search for "zelda" and return images for the
# # first five games that are returned from the search.
# GameCoverFinder.new.display_images("zelda", 5)
# 
# 

class GameCoverFinder

  GAME_LIST_URL = "http://thegamesdb.net/api/GetGamesList.php?name="
  GAME_URL = "http://thegamesdb.net/api/GetGame.php?id="

  def display_images(query, limit=50)
    query = URI::encode(query)
    game_images = []
    game_ids = get_game_ids(query, limit)
    game_ids.each do |game_id|
      url = GAME_URL + game_id
      data = HTTParty.get(url).parsed_response['Data']
      base_img_url = data['baseImgUrl']
      title = data['Game']['GameTitle']
      boxart = get_boxart(data['Game']['Images']['boxart'], base_img_url) || []
      fanart = get_fanart(data['Game']['Images']['fanart'], base_img_url) || []
      backdrop = fanart.empty? ? nil : fanart.sample
      game_images << {title:title, images:boxart+fanart, backdrop:backdrop}
    end

    return game_images
  end

  private

  def get_game_ids(query, limit)
    url = GAME_LIST_URL + query
    games_list = HTTParty.get(url).parsed_response['Data']['Game'] || []
    game_ids = []
    if games_list.kind_of?(Array)
      games_list.first(limit).each { |game| game_ids << game['id'] }
    else
      game_ids << games_list['id']
    end

    return game_ids
  end

  def get_boxart(boxart_images, base_img_url)
    boxart = []
    if boxart_images.kind_of?(Array)
      boxart_images.each { |boxart_image| boxart << boxart_image['__content__'] }
    elsif boxart_images.kind_of?(Hash)
      boxart << boxart_images['__content__']
    end

    return boxart.map { |url| base_img_url+url }
  end

  def get_fanart(fanart_images, base_img_url)
    unless fanart_images.nil?
      fanart = store_fanart_images(fanart_images, base_img_url)
    end

    return fanart
  end

  def store_fanart_images(fanart_images, base_img_url)
    image_urls = []
    if fanart_images.kind_of?(Array)
      fanart_images.each { |fanart| image_urls << fanart['thumb'] }
      image_urls = image_urls.map { |url| base_img_url+url }
    elsif fanart_images.kind_of?(Hash)
      image_urls << base_img_url+fanart_images['thumb']
    end

    return image_urls
  end
end

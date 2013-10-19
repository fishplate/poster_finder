require 'httparty'
require 'open-uri'
require 'json'

class GameCoverFinder

  GAME_LIST_URL = "http://thegamesdb.net/api/GetGamesList.php?name="
  GAME_URL = "http://thegamesdb.net/api/GetGame.php?id="

  def display_images(query)
    game_ids = get_game_ids(query)
    url = GAME_URL + game_ids[0]
    data = HTTParty.get(url).parsed_response['Data']
    base_img_url = data['baseImgUrl']
    title = data['Game']['GameTitle']
    puts get_boxart(data['Game']['Images']['boxart'], base_img_url)
    puts get_fanart(data['Game']['Images']['fanart'], base_img_url)
    return '---'
  end

  def get_game_ids(query)
    url = GAME_LIST_URL + query
    games_list = HTTParty.get(url).parsed_response['Data']['Game']
    game_ids = []
    games_list.each do |game|
      game_ids << game['id']
    end
    return game_ids
  end

  def get_boxart(boxart_images, base_img_url)
    boxart_front, boxart_back = nil
    boxart_images.each do |boxart|
      if boxart['side'] == 'front'
        boxart_front = boxart['__content__']
      elsif boxart['side'] == 'back'
        boxart_back = boxart['__content__']
      end
    end
    return [boxart_front, boxart_back].map { |url| base_img_url+url }
  end

  def get_fanart(fanart_array, base_img_url)
    image_url = nil
    image_urls = []
    fanart_array.each do |fanart|
      image_urls << fanart['original']['__content__']
    end
    return image_urls.map { |url| base_img_url+url } 
  end



end



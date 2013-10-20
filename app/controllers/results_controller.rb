# Results controller to return expected results
class ResultsController < ApplicationController
  def index
    query_string = params[:submit_type]
    process_search(query_string)
  end

  protected

  def process_search(query_string)
    search_string = params[:search]
    if !values_missing?(query_string, search_string)
      match_query(query_string, search_string)
    else
      redirect_to root_path
    end
  end

  def search_movie(query)
    if !query.empty?
      @movies = true
      conf = movie_client.movie_image_config
      results = movie_client.search_movie(query)
      @results = removed_nil_images(results)
      @image = conf[:base_url] + conf[:size]
      check_for_nil_results(@results)
    else
      redirect_to root_path
    end
  end

  def search_game(query)
    if !query.empty?
      @games = true
      @results = game_client.display_images(query, 5)
      check_for_nil_results(@results)
    else
      redirect_to root_path
    end
  end

  def search_music(query)
    if !query.empty?
      @music = true
      @results = music_client.music_search(query)
      check_for_nil_results(@results)
    else
      redirect_to root_path
    end
    
  end

  def match_query(query_string, search_string)
    case query_string
    when 'movie'
      search_movie(search_string)
    when 'game'
      search_game(search_string)
    when 'music'
      search_music(search_string)
    else
      redirect_to root_path
    end
  end

  def removed_nil_images(results)
    results.delete_if {|x| x[:image].nil?}
  end

  def check_for_nil_results(results)
    message = 'sorry, no images found for that query'
    redirect_to root_path, notice: message if results.empty?
  end
end

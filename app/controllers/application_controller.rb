class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def movie_client
    @movie_client ||= MoviePosterFinder.new(movie_api_key)
  end

  def movie_api_key
    ENV['MOVIE_API_KEY'] || 'no_key'
  end

  def values_missing?(query_string, search_string)
    empty_string?(query_string) || empty_string?(search_string)
  end

  def empty_string?(query_string)
    query_string.nil? || query_string.to_s.empty?
  end
end

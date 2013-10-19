module ApplicationHelper

  def movie_finder
    @movie_finder ||= MoviePosterFinder.new(movie_api_key)
  end

  def games_finder
    @games_finder ||= GameCoverFinder.new
  end

  def movie_api_key
    ENV['MOVIE_API_KEY']
  end
end

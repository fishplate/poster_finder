require 'spec_helper'

describe MoviePosterFinder do
  context 'query for movie details' do
    before(:each) do
      mock_Poster = double('MoviePosterFinder')
      mock_response = double('MockResponse')
      results = {results: [
        {
          backdrop_path: '4iJfYYoQzZcONB9hNzg0J0wWyPH.jpg',
          original_title: 'Star Wars: Episode IV - A New Hope',
          poster_path: 'tvSlBzAdRE29bZe5yYWrJ2ds137.jpg',
          title: 'Star Wars: Episode IV - A New Hope'
        },
        {
          backdrop_path: '4iJfYYoQzZcONB9hNzg0223wWyPH.jpg',
          original_title: 'Star Wars: - A New Hope',
          poster_path: 'tvSlBzAdRE29123bZe5yYWrJ2ds137.jpg',
          title: 'Star Wars: - A New Hope'
        }
      ]}.to_json
      mock_response.stub(:body).and_return(results)
      HTTParty.stub(:get).and_return(mock_response)
    end

    it 'should get results for query' do
      @movie_poster = MoviePosterFinder.new
      result = @movie_poster.search_movie('star wars')
      result.count.should == 2
      result.first[:title].should eq('Star Wars: Episode IV - A New Hope')
    end
  end

  context 'query for image config' do
    before(:each) do
      mock_response = double('MockResponse')
      results = {images: {
        base_url: 'http://someplace.com',
        poster_sizes: [
          'w185',
          'original'
        ]
      }}.to_json
      mock_response.stub(:body).and_return(results)
      HTTParty.stub(:get).and_return(mock_response)
    end

    it 'should return image config' do
      @movie_poster = MoviePosterFinder.new
      result = @movie_poster.movie_image_config
      result[:base_url].should eq('http://someplace.com')
      result[:size].should eq('original')
    end
  end
end
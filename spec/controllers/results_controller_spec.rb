require 'spec_helper'

describe ResultsController do
  before(:each) do
    mock_response = double('MockResponse')
    results = {images: {
        base_url: 'http://someplace.com',
        poster_sizes: [
          'w185',
          'original'
        ]
      },
      results: [
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

  context 'movie searching' do
    it 'should search for movie' do
      get :index, search: 'star', submit_type: 'movie'
      response.should be_ok
      assigns(:results).should_not be_nil
      assigns(:image).should_not be_nil
    end

    it 'should redirect if no movie criteria entered' do
      get :index, submit_type: 'movie'
      response.should be_redirect
    end

    it 'should redirect if no query entered' do
      get :index, search: 'star'
      response.should be_redirect
    end
  end

  context 'no entries found' do
    before(:each) do
      mock_response = double('MockResponse')
      results = {images: {
          base_url: 'http://someplace.com',
          poster_sizes: [
            'w185',
            'original'
          ]
        },
        results: []
      }.to_json
      mock_response.stub(:body).and_return(results)
      HTTParty.stub(:get).and_return(mock_response)
    end

    it 'should redirect to root path with notice' do
      get :index, search: 'star', submit_type: 'movie'
      message = 'sorry, no images found for that query'
      flash[:notice].should eq(message)
      response.should be_redirect
    end
  end
end

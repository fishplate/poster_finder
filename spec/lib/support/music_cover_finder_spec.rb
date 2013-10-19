require 'spec_helper'

describe MusicCoverFinder do
  context 'query for music details' do
    before(:each) do
      mock_response = double('MockResponse')
      results = {results: [
        {
          artistName: 'AC/DC',
          collection: 'Back In Black',
          artworkUrl100: 'http://someplace.jpg'
        },
        {
          artistName: 'AC/DC',
          collection: 'Dirty Deeds Done Dirt Cheap',
          artworkUrl100: 'http://someplace2.jpg'
        }
      ]}.to_json
      mock_response.stub(:body).and_return(results)
      HTTParty.stub(:get).and_return(mock_response)
    end

    it 'should return response for music query' do
      results = MusicCoverFinder.new.music_search('acdc')
      results.count.should == 2
      results.first[:artist].should eq('AC/DC')
    end
  end
end

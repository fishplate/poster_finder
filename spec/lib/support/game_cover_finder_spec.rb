require 'spec_helper'

describe GameCoverFinder do
  context 'query for valid game cover art' do
    before(:each) do
      gameslist = {"Data"=>{"Game"=>[{"id"=>"113", "GameTitle"=>"The Legend of Zelda", "ReleaseDate"=>"02/21/1986", "Platform"=>"Nintendo Entertainment System (NES)"}, {"id"=>"14574", "GameTitle"=>"The Legend of Zelda", "Platform"=>"Nintendo Wii"}, {"id"=>"14755", "GameTitle"=>"Zelda's Adventure", "ReleaseDate"=>"06/05/1994", "Platform"=>"Philips CD-i"}, {"id"=>"198", "GameTitle"=>"Zelda II: The Adventure of Link", "ReleaseDate"=>"01/14/1987", "Platform"=>"Nintendo Game Boy Advance"}, {"id"=>"2758", "GameTitle"=>"Zelda II: The Adventure of Link", "ReleaseDate"=>"09/26/1988", "Platform"=>"Nintendo Entertainment System (NES)"}, {"id"=>"5954", "GameTitle"=>"The Legend of Zelda: The Minish Cap", "ReleaseDate"=>"01/10/2005", "Platform"=>"Nintendo Game Boy Advance"}, {"id"=>"14753", "GameTitle"=>"Zelda: The Wand of Gamelon", "ReleaseDate"=>"10/10/1993", "Platform"=>"Philips CD-i"}, {"id"=>"109", "GameTitle"=>"The Legend of Zelda: Twilight Princess", "ReleaseDate"=>"11/19/2006", "Platform"=>"Nintendo Wii"}, {"id"=>"161", "GameTitle"=>"The Legend of Zelda: Ocarina of Time", "ReleaseDate"=>"11/21/1998", "Platform"=>"Nintendo 64"}, {"id"=>"174", "GameTitle"=>"The Legend of Zelda: The Wind Waker", "ReleaseDate"=>"03/24/2003", "Platform"=>"Nintendo GameCube"}, {"id"=>"175", "GameTitle"=>"The Legend of Zelda: Majora's Mask", "ReleaseDate"=>"10/26/2000", "Platform"=>"Nintendo 64"}, {"id"=>"1318", "GameTitle"=>"The Legend of Zelda: A Link to the Past", "ReleaseDate"=>"11/21/1991", "Platform"=>"Super Nintendo (SNES)"}, {"id"=>"2245", "GameTitle"=>"The Legend of Zelda: Phantom Hourglass", "ReleaseDate"=>"06/23/2007", "Platform"=>"Nintendo DS"}, {"id"=>"2383", "GameTitle"=>"The Legend of Zelda: Collector's Edition", "ReleaseDate"=>"11/17/2003", "Platform"=>"Nintendo GameCube"}, {"id"=>"3193", "GameTitle"=>"The Legend of Zelda: Link's Awakening", "ReleaseDate"=>"08/01/1993", "Platform"=>"Nintendo Game Boy"}, {"id"=>"5434", "GameTitle"=>"The Legend of Zelda: Twilight Princess", "ReleaseDate"=>"12/11/2006", "Platform"=>"Nintendo GameCube"}, {"id"=>"6122", "GameTitle"=>"The Legend of Zelda: Oracle of Ages", "ReleaseDate"=>"05/14/2001", "Platform"=>"Nintendo Game Boy Color"}, {"id"=>"6123", "GameTitle"=>"The Legend of Zelda: Oracle of Seasons", "ReleaseDate"=>"05/14/2001", "Platform"=>"Nintendo Game Boy Color"}, {"id"=>"6818", "GameTitle"=>"The Legend of Zelda: Spirit Tracks", "ReleaseDate"=>"12/07/2009", "Platform"=>"Nintendo DS"}, {"id"=>"6996", "GameTitle"=>"The Legend of Zelda: Four Swords Adventures", "ReleaseDate"=>"06/07/2004", "Platform"=>"Nintendo GameCube"}]}}
      gameinfo1 = {"Data"=>{"baseImgUrl"=>"http://thegamesdb.net/banners/", "Game"=>{"id"=>"113", "GameTitle"=>"The Legend of Zelda", "PlatformId"=>"7", "Platform"=>"Nintendo Entertainment System (NES)", "ReleaseDate"=>"02/21/1986", "Overview"=>"Ganon, the King of Evil, breaks free from the Dark World and captures Hyrule's beloved Princess Zelda. Before she is caught, Zelda manages to shatter the Triforce of Wisdom and scatter its eight pieces throughout Hyrule. Link swears to recover the Triforce pieces and rescue Princess Zelda from Ganon's clutches.", "ESRB"=>"E - Everyone", "Genres"=>{"genre"=>"Role-Playing"}, "Players"=>"1", "Co_op"=>"No", "Publisher"=>"Nintendo", "Developer"=>"Nintendo", "Actors"=>"N/A", "Rating"=>"8", "Images"=>{"fanart"=>[{"original"=>{"width"=>"1920", "height"=>"1080", "__content__"=>"fanart/original/113-1.jpg"}, "thumb"=>"fanart/thumb/113-1.jpg"}, {"original"=>{"width"=>"1920", "height"=>"1080", "__content__"=>"fanart/original/113-2.jpg"}, "thumb"=>"fanart/thumb/113-2.jpg"}, {"original"=>{"width"=>"1920", "height"=>"1080", "__content__"=>"fanart/original/113-3.jpg"}, "thumb"=>"fanart/thumb/113-3.jpg"}, {"original"=>{"width"=>"1280", "height"=>"720", "__content__"=>"fanart/original/113-4.jpg"}, "thumb"=>"fanart/thumb/113-4.jpg"}, {"original"=>{"width"=>"1920", "height"=>"1080", "__content__"=>"fanart/original/113-5.jpg"}, "thumb"=>"fanart/thumb/113-5.jpg"}, {"original"=>{"width"=>"1920", "height"=>"1080", "__content__"=>"fanart/original/113-6.jpg"}, "thumb"=>"fanart/thumb/113-6.jpg"}, {"original"=>{"width"=>"1920", "height"=>"1080", "__content__"=>"fanart/original/113-7.jpg"}, "thumb"=>"fanart/thumb/113-7.jpg"}, {"original"=>{"width"=>"1920", "height"=>"1080", "__content__"=>"fanart/original/113-8.jpg"}, "thumb"=>"fanart/thumb/113-8.jpg"}], "boxart"=>[{"side"=>"back", "width"=>"1000", "height"=>"1422", "thumb"=>"boxart/thumb/original/back/113-1.jpg", "__content__"=>"boxart/original/back/113-1.jpg"}, {"side"=>"front", "width"=>"1000", "height"=>"1425", "thumb"=>"boxart/thumb/original/front/113-1.jpg", "__content__"=>"boxart/original/front/113-1.jpg"}], "banner"=>{"width"=>"760", "height"=>"140", "__content__"=>"graphical/113-g.png"}}}}}
      gameinfo2 = {"Data"=>{"baseImgUrl"=>"http://thegamesdb.net/banners/", "Game"=>{"id"=>"14574", "GameTitle"=>"The Legend of Zelda", "PlatformId"=>"9", "Platform"=>"Nintendo Wii", "Images"=>{"boxart"=>{"side"=>"front", "width"=>"769", "height"=>"1086", "thumb"=>"boxart/thumb/original/front/14574-1.png", "__content__"=>"boxart/original/front/14574-1.png"}}}}}
      gameinfo3 = {"Data"=>{"baseImgUrl"=>"http://thegamesdb.net/banners/", "Game"=>{"id"=>"14755", "GameTitle"=>"Zelda's Adventure", "PlatformId"=>"4917", "Platform"=>"Philips CD-i", "ReleaseDate"=>"06/05/1994", "Overview"=>"As the brave warrior, Princess Zelda, it's your mission to thwart the enemy, Gannon, who has captured Link and taken over Tolemac. On the way to freeing Link, you'll journey deep into the Seven Shrines of the Underworld. You will acquire powerful weapons as you fight evil characters in your attempt to restore the Age of Lightness to this magical land.", "Genres"=>{"genre"=>["Action", "Adventure"]}, "Players"=>"1", "Co_op"=>"No", "Publisher"=>"Philips Media", "Developer"=>"Viridis", "Images"=>{"boxart"=>[{"side"=>"back", "width"=>"640", "height"=>"554", "thumb"=>"boxart/thumb/original/back/14755-1.jpg", "__content__"=>"boxart/original/back/14755-1.jpg"}, {"side"=>"front", "width"=>"640", "height"=>"627", "thumb"=>"boxart/thumb/original/front/14755-1.jpg", "__content__"=>"boxart/original/front/14755-1.jpg"}]}}}}
      HTTParty.stub_chain(:get, :parsed_response).and_return(gameslist, gameinfo1, gameinfo2, gameinfo3)
    end

    it 'should get results for query' do
      game_covers = GameCoverFinder.new
      result = game_covers.display_images("zelda", 1)
      result.should be_kind_of(Array)
    end

    it "result should be an array of hashes" do
      game_covers = GameCoverFinder.new
      result = game_covers.display_images("zelda", 1)
      result.first.should be_kind_of(Hash)
    end

    it "result should contain correct data" do
      game_covers = GameCoverFinder.new
      result = game_covers.display_images("zelda", 1) 
      result.first[:title].should eq("The Legend of Zelda")
      result.first[:images].should be_kind_of(Array)
    end

    it "should return 2 results if 2 is entered as an argument" do
      result = GameCoverFinder.new.display_images("zelda", 2)
      result.length.should eq(2)
    end

    it "should return 3 results if 3 is entered as an argument" do
      result = GameCoverFinder.new.display_images("zelda", 3)
      result.length.should eq(3)
    end
  end

  context "query returns no results" do
    before(:each) do
      results = {"Data"=>"\n"}
      HTTParty.stub_chain(:get, :parsed_response).and_return(results)
    end

    it 'should return empty array' do
      game_covers = GameCoverFinder.new
      result = game_covers.display_images("blahblahblahblah", 1)
      result.should eq([])
    end
  end
end

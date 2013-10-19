require 'spec_helper'

describe MoviePosterFinder do
  it 'should respond with it works' do
    MoviePosterFinder.new.check_works.should eq('yes it does')
  end
end
require 'spec_helper'

describe MainsController do

  it 'should get index' do
    get :index
    response.should be_ok
  end

end

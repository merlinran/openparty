require 'spec_helper'

describe RegistrationsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "POST 'create'" do
    it "returns http success" do
      post 'create'
      response.should redirect_to(checkin_url)
    end
  end

end

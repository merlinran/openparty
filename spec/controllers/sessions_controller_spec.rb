require 'spec_helper'

describe SessionsController do

  describe "login through 3rd party account" do
    let(:valid_auth_hash) do
      env = {}
      env['omniauth.auth'] = {
        provider: "developer",
        uid: "valid@email.com",
        info: OmniAuth::AuthHash::InfoHash.new(
          name: "Valid Name",
          email:"valid@email.com")
      }
      request = ActionDispatch::Request.new(env)
    end

    let(:auth_without_email) { { name: "Valid Name", email:"valid@email.com" }}

    context "when user not logged in" do

      context "with valid credentials" do
        it "redirects to referer" do
          p valid_auth_hash
          post :create,  request: valid_auth_hash
          response.should redirect_to(login_url)
        end
      end

      context "without valid credentials" do
      end
    end

  end

end

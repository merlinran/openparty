require 'spec_helper'

describe EventsController do
  let(:user) { stub_model(User) }
  let(:admin) { stub_model(User, role: "admin") }

  describe "GET new" do
  
    context "when user not logged in" do
      it "redirects to login page" do
        get :new
        response.should redirect_to(login_url)
      end
    end
   
    context "when user logged in as non-admin" do
      it "redirects to home page" do
        subject.stub(:current_user).and_return(user)
        get :new
        response.should redirect_to(root_url)
      end
    end
   
    context "when user logged in as admin" do
      it "renders new event page" do
        p admin
        subject.stub(:current_user).and_return(admin)
        get :new
        response.should render_template("new")
      end
    end
  
  end

end

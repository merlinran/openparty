require 'spec_helper'

describe EventsController do

  let(:user) { stub_model(User) }
  let(:admin) { stub_model(User, role: "admin") }

  describe "GET new" do

    context "when user not logged in" do
      it "redirects to login page" do
        get :new
        response.should redirect_to(login_url)
        flash[:notice].should eq(I18n.t(:please_login))
      end
    end

    context "when user logged in as non-admin" do
      it "prompts and redirects to home page" do
        subject.stub(:current_user).and_return(user)
        get :new
        response.should redirect_to(root_url)
        flash[:notice].should eq(I18n.t(:admin_required))
      end
    end

    context "when user logged in as admin" do
      it "renders new event page" do
        subject.stub(:current_user).and_return(admin)
        get :new
        response.should render_template("new")
        flash[:notice].should be_nil
      end
    end

  end

end

require 'spec_helper'

shared_examples "public actions," do |*actions|
  before do
    subject.stub(:current_user).and_return(nil);
  end
  actions.each do |action|
    it "#{action} action should not require login" do
      get action, id: 1
      response.should  be_success
      flash[:error].should be_nil
    end
  end
end

shared_examples "user actions," do |*actions|
  before do
    subject.stub(:current_user).and_return(nil);
  end
  actions.each do |action|
    it "#{action} action should redirect to login page" do
      get action, id: 1
      response.should redirect_to(login_url)
      flash[:error].should eq(I18n.t(:please_login))
    end
  end
end

shared_examples "admin actions," do |*actions|
  it_behaves_like "user actions,", actions

  context "when normal user logged in," do
    let(:user) { mock_model(User).as_null_object }
    before do
      controller.stub(:current_user).and_return(user);
    end
    actions.each do |action|
      it "#{action} action should redirect to home page" do
        get action, id: 1
        response.should redirect_to(root_url)
        flash[:error].should eq(I18n.t(:admin_required))
      end
    end
  end

  context "when admin user logged in," do
    let(:admin) { mock_model(User).stub(admin?).and_return(true)  }
    before do
      subject.stub(:current_user).and_return(admin);
    end
    actions.each do |action|
      it "#{action} action should success" do
        get action, id: 1
        response.should  be_success
        flash[:error].should be_nil
      end
    end
  end
end

describe EventsController do
  before do
    Event.stub(:find).and_return(mock(Event))
  end
  it_behaves_like "public actions,", :index, :show
  it_behaves_like "admin actions,", :new,:create, :edit, :update
end

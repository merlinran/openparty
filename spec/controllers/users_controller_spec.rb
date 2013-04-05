require 'spec_helper'

describe UsersController do
  let(:user) { stub_model(User) }

  describe "PUT update" do
    context "with invalid image format" do
      it "redirects back to edit user page" do
        subject.stub(:current_user).and_return(user)
        pending
        # put :update, user: {
        #  avatar: stub(StringIO).stub(:original_filename).and_return("a.tft") }
        response.should redirect_to(edit_user_path)
      end
    end
  end
end

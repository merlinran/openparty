module ControllerMacros
  def self.included(base)  
    base.extend(ClassMethods)  
  end

  module ClassMethods
    def it_should_require_login_for_actions(*actions)
      actions.each do |action|
        it "#{action} action should require login" do
          get action, id: 1
          response.should redirect_to(login_url)
          flash[:notice].should eq(I18n.t(:please_login))
        end
      end
    end

    def should_redirect_to(url, notice)
      it "should redirects to  #{url} with notice #{notice}" do
        response.should redirect_to(url)
        flash[:notice].should eq(I18n.t(notice))
      end
    end

    def should_render_template(template)
      it "should render template #{template}" do
        response.should render_template(template)
        flash[:notice].should be_nil
      end
    end
  end

end

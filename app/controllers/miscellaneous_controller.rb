class MiscellaneousController < ApplicationController
  skip_before_filter :ensure_logged_in
  def about
  end
end

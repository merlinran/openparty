require 'spec_helper'

describe RecordsController do

  let(:user) { User.new }
  let(:event) { Event.new }

  def valid_attributes
    { title: "my title", text: "my text"}
  end

  def valid_session
    {}
  end

end

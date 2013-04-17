require 'spec_helper'

describe "records/edit" do
  before(:each) do
    @record = assign(:record, stub_model(Record,
      :user_id => 1,
      :title => "MyString",
      :text => "MyText",
      :event_id => 1
    ))
  end

  it "renders the edit record form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => records_path(@record), :method => "post" do
      assert_select "input#record_user_id", :name => "record[user_id]"
      assert_select "input#record_title", :name => "record[title]"
      assert_select "textarea#record_text", :name => "record[text]"
      assert_select "input#record_event_id", :name => "record[event_id]"
    end
  end
end

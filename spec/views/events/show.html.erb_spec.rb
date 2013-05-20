# encoding: utf-8

shared_examples_for "any events" do
  before { render }
  it "shows the event name" do
    rendered.should have_selector("h2", content: event.name)
  end

  it "shows the event poster image" do
    rendered.should have_selector("img", src: event.poster_url)
  end

  it "shows enrolments list" do
    rendered.should have_selector("div", id: "enrolments")
  end

  it "shows topics list" do
    rendered.should have_selector("div", id: "topics")
  end

end

shared_examples_for "pending events" do
  before do
    event.stub(:hold_date).and_return(Date.tomorrow)
    render
  end
  it "shows new enrolment form" do
    rendered.should have_selector("form", id: "new_enrolment")
  end
  it "doesn't show records list" do
    rendered.should_not have_selector("div", id: "records")
  end
end

shared_examples_for "current event" do
  before do
    event.stub(:hold_date).and_return(Date.today)
    render
  end
  it "shows enrol button" do
    rendered.should have_selector("div", id: "new_enrolment")
  end
  it "doesn't show records list" do
    rendered.should_not have_selector("div", id: "records")
  end
end


shared_examples_for  "past events" do
  before do
    event.stub(:hold_date).and_return(Date.new(2000,1,1))
    render
  end
  it "shows records list" do
    rendered.should have_selector("div", id: "records")
  end

  it "doesn't show enrol button" do
    rendered.should_not have_selector("div", id: "new_enrolment")
  end
end

describe "events/show.html.erb" do
  let(:event) { stub_model(Event,
                           name: "第四期",
                           hold_date: Date.today(),
                           location: "某咖啡馆",
                           poster_url: "http://x.com/yy.jpg",
                           detail: "活动详情省略500字").as_null_object }
  let(:user) { stub_model(User); }

  before do
    assign :event, event
    view.stub(:current_user).and_return(user)
  end

  def setup_stub(attrs)
    attrs.each do |key, value|
      view.stub(key).and_return(value)
    end
  end

  context "when guest accessing" do
    before do
      setup_stub(logged_in?: false, admin?: false)
    end
    it_behaves_like "any events"
    it_behaves_like "pending events"
    it_behaves_like "past events"
  end

  context "when normal user accessing" do
    before do
      setup_stub(logged_in?: true, admin?: false)
    end
    it_behaves_like "any events"
    it_behaves_like "pending events"
    it_behaves_like "past events"
  end

  context "when admin accessing" do
    before do
      setup_stub(logged_in?: true, admin?: true)
    end
    it_behaves_like "any events"
    it_behaves_like "pending events"
    it_behaves_like "past events"
    it "shows edit event link"
    it "shows destroy event link"
  end

end

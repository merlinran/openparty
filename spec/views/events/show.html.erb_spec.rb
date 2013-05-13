# encoding: utf-8
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
  end

  it "shows the event" do
    controller.stub(:logged_in?).and_return(true)
    controller.stub(:admin?).and_return(false)
    render
    rendered.should have_selector("img", "href", event.poster_url)
  end

  context "" do
    it "" do
      pending
    end
  end
end

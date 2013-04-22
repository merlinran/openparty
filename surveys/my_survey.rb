# encoding: UTF-8
survey "重庆OpenParty参与度调查", :default_mandatory => false do

  section "基础问题" do
    q "你所属的行业和专业？"
    a :string

    q "你有哪些主要的兴趣爱好？"
    a :string

    q "你是从什么渠道得知OpenParty的？", pick: :one
    a "豆瓣"
    a "新浪微博"
    a "朋友介绍"
    a "其它", :string

    q_1 "你参加过哪几期活动？", :pick => :any
    Event.all.each { |e| a I18n.l(e.hold_date, format: :long) + '---' + e.name }

    q "是什么让你在这么多中选择参加OpenParty？"
    dependency :rule => "A"
    condition_A :q_1, "count>0"
    a :string

  end
end

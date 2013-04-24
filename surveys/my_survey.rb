# encoding: UTF-8
survey "重庆OpenParty参与度调查", :default_mandatory => true do

  section "基础问题" do
    q "简单介绍你的行业和专业？"
    a :string

    q "你主要的兴趣爱好？"
    a :string

    q "你是从什么渠道得知OpenParty的？", pick: :one
    a "豆瓣"
    a "新浪微博"
    a "朋友介绍"
    a "其它", :string

    q_1 "你参加过哪几期活动？", :pick => :any
    Event.order("updated_at desc").each { |e| a I18n.l(e.hold_date, format: :long) + '\t' + e.name }

    q "业余活动那么多，是什么吸引你选择参加OpenParty？"
    dependency :rule => "A"
    condition_A :q_1, "count>0"
    a :text

    q "你参加过的OpenParty在哪些方面符合或超出预期？"
    dependency :rule => "A"
    condition_A :q_1, "count>0"
    a :text

    q "你对OpenParty不满意的地方？"
    dependency :rule => "A"
    condition_A :q_1, "count>0"
    a :text

    q "你希望OpenParty网站发挥什么作用？"
    a :text

    q "其它建议？"
    a :text

  end
end

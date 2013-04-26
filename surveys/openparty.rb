# encoding: UTF-8
survey "重庆OpenParty参与者问卷调查", :default_mandatory => true do

  section "耗时五到十分钟" do

    q "怎么称呼您？"
    a :string

    q "请给一个联系方式（邮件/QQ/微博/...）"
    a :string

    q "简单介绍您的行业和专业？"
    a :string

    q "您主要的几个兴趣爱好？"
    a :string

    q "您通常在哪天比较空闲？", pick: :one
    a "星期六"
    a "星期天"
    a "整个周末"
    a "其它", :string

    q "您是从什么渠道得知OpenParty的？", pick: :one
    a "豆瓣"
    a "新浪微博"
    a "朋友介绍"
    a "其它", :string

    q_1 "您参加过哪几期活动？", :pick => :any
    Event.order("hold_date desc").each { |e| a I18n.l(e.hold_date, format: :long) + " --- " + e.name }

    group "未参加过活动，请回答以下问题" do
      dependency :rule => "A"
      condition_A :q_1, "count==0"

      q "您对OpenParty有什么期待？"
      a :text

      q "都是什么原因未能参加活动呢？"
      a :text
    end

    group "参加过活动，请回答以下问题" do
      dependency :rule => "A"
      condition_A :q_1, "count>0"

      q "业余活动那么多，是什么吸引您选择参加OpenParty？"
      a :text

      q "您参加过的OpenParty在哪些方面满足您最初的预期？"
      a :text

      q "不满意的方面？"
      a :text
    end

    q "后期您希望以什么角色参与到OpenParty中？", pick: :any
    a "听众"
    a "分享者"
    a "志愿者"
    a "其它", :string

    q "您希望OpenParty网站发挥什么作用？"
    a :text

    q "其它建议？", is_mandatory: false
    a :text

  end
end

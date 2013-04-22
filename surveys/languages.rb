# encoding: UTF-8
survey "One language is never enough" do
  translations :cn => "translations/languages.cn.yml"
  section_one "One" do
    g_hello "Hello" do
	    q_name "What is your name?"
	    a_name :string, :help_text => "My name is..."
	  end
  end
end

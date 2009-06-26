module QuizzesHelper

  def add_question_link(name, f)
    link_to_function name do |page|
      page.insert_html :bottom, :questions, :partial => 'question', :object => Question.new, :locals => {:quiz_form => f}
    end
  end
end

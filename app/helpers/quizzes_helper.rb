module QuizzesHelper

#  def add_question_link(name, f)
#    link_to_function name do |page|
#      page.insert_html :bottom, :questions, :partial => 'question', :locals => {:quiz_form => f}
#    end
#  end

  def setup_quiz(quiz)
    returning(quiz) do |q|
      q.questions.build
    end
  end
end

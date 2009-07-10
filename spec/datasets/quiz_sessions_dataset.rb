#
#
# in test/datasets/quizzes_dataset.rb
#
class QuizSessionsDataset < Dataset::Base
  uses :users, :quizzes

  def load
    create_quiz_session :first, :doug, :first
    create_quiz_session :second, :doug, :second
    create_quiz_session :third, :dan, :first
    create_quiz_session :fourth, :dan, :third
    puts "#{QuizSession.count} records created."
  end

  helpers do
    def create_quiz_session(sym, user, quiz, attributes={})
      defaults = {:user_id => user_id(user), :quiz_id => quiz_id(quiz)}
      create_record :quiz_session, sym, defaults.merge(attributes)
    end
  end
end

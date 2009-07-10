#
#
# in test/datasets/questions_dataset.rb
#
class QuestionsDataset < Dataset::Base
  uses :quizzes

  def load
    create_question "What is your favorite color?", :first, :first
    create_question "What is your favorite flower?", :second, :first
    create_question "What are your favorite games?", :third, :first
    create_question "What kind of Mexican food do you prefer?", :fourth, :second
    create_question "What kind of Italian food do your prefer?", :fifth, :second
    create_question "How about Chinese food?", :sixth, :second
    create_question "What testing framework is best?", :seventh, :third
    create_question "What Rails magic is the coolest?", :eighth, :third
    create_question "How templating system is best?", :ninth, :third
  end

  helpers do
    def create_question(text, sym, quiz, attributes={})
      defaults = { :question_text => text, :quiz_id => quiz_id(quiz)}
      create_record :question, sym, defaults.merge(attributes)
    end
  end
end

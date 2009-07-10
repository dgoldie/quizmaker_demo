#
#
# in test/datasets/quizzes_dataset.rb
#
class QuizzesDataset < Dataset::Base
  uses :users

  def load
    create_quiz "Favorites Quiz", :first, :curly
    create_quiz "Food Quiz", :second, :larry
    create_quiz "Rails Quiz", :third, :moe
  end

  helpers do
    def create_quiz(name, sym, user, attributes={})
      defaults = { :name => name, :user_id => user_id(user)}
      create_record :quiz, sym, defaults.merge(attributes)
    end
  end
end

class QuizSession < ActiveRecord::Base
  belongs_to :quiz
  belongs_to :user
  belongs_to :quiz_state
  has_many :answers


end

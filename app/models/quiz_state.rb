#
# string - name
#
#

class QuizState < ActiveRecord::Base
  has_many :quiz_sessions
end

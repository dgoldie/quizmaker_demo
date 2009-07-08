#
# string: value
#

class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :quiz_session

end

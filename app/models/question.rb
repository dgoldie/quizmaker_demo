#
#
#  t.string :question_text
#

class Question < ActiveRecord::Base
	belongs_to :quiz
  has_many :answers

  validates_presence_of :question_text, :on => :create, :message => "can't be blank"
 
end
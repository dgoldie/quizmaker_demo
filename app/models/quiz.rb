#      t.integer :user_id
#      t.string :name
#
#      t.timestamps
#
# used techniques found here:
# http://sifent.com/blog/2009/05/28/rails-nested-forms-jquery/
# http://ryandaigle.com/articles/2009/2/1/what-s-new-in-edge-rails-nested-attributes
# with:
# - translated javascript from jquery to prototype
# - :all_blank didn't work
#   it isn't in my version of rails (2.3.2). which of course is strange
#   since they say there are using 2.3.2 as well. 
#   The rails commit that has it is dated may 9th.
#   http://github.com/rails/rails/commit/9010ed27559ed5ab89ea71b4b16f4c8e56d03dbb
#   ????
#   in any case, I just gave the proc here and it works fine.
#
#      t.integer :user_id
#      t.string :name
#
#

class Quiz < ActiveRecord::Base
  has_many :questions
  has_many :answer
  has_many :quiz_sessions
  belongs_to :user

  accepts_nested_attributes_for :questions, :allow_destroy => true,
            :reject_if => proc { |attributes| attributes.all? {|k,v| v.blank?} }
end

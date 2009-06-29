#      t.integer :user_id
#      t.string :name
#
#      t.timestamps


class Quiz < ActiveRecord::Base
  has_many :questions
  belongs_to :user

  accepts_nested_attributes_for :questions, :allow_destroy => true,
            :reject_if => proc { |attributes| attributes.all? {|k,v| v.blank?} }

end

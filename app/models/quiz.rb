#      t.integer :user_id
#      t.string :name
#
#      t.timestamps


class Quiz < ActiveRecord::Base
  belongs_to :user
end

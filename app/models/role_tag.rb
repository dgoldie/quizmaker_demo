class RoleTag < ActiveRecord::Base
  belongs_to :user
  validates_inclusion_of :role_name, :in => %w( author student )

end


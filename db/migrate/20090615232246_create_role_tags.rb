class CreateRoleTags < ActiveRecord::Migration
  def self.up
    create_table :role_tags do |t|
      t.integer :user_id
      t.string :role_name

      t.timestamps
    end
  end

  def self.down
    drop_table :role_tags
  end
end

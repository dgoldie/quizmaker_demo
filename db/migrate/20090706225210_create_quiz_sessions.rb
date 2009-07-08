class CreateQuizSessions < ActiveRecord::Migration
  def self.up
    create_table :quiz_sessions do |t|
      t.integer :quiz_id, :user_id, :quiz_state_id
      t.timestamps
    end
  end

  def self.down
    drop_table :quiz_sessions
  end
end

class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.integer :question_id, :quiz_session_id
      t.string :value

      t.timestamps
    end
  end

  def self.down
    drop_table :answers
  end
end

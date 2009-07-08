class CreateQuizStates < ActiveRecord::Migration
  def self.up
    create_table :quiz_states do |t|
      t.string :name

      t.timestamps
    end

    %w(Assigned Taking Finished Evaluated).each do |state|
      QuizState.create :name => state
    end

  end

  def self.down
    drop_table :quiz_states
  end
end

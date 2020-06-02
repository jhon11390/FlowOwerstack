class CreateVoteAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :vote_answers do |t|
      t.references :answer, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

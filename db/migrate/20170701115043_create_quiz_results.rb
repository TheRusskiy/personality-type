class CreateQuizResults < ActiveRecord::Migration[5.0]
  def change
    create_table :quiz_results do |t|
      t.string :personality_type, null: false
      t.references :user, null: false
      t.timestamps
    end
  end
end

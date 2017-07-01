class CreateQuizRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :quiz_requests do |t|
      t.references :user
      t.timestamps
    end
  end
end

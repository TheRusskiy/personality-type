class AddExtraFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :department, :string
    add_column :users, :region, :string
    add_column :users, :job_title, :string
  end
end
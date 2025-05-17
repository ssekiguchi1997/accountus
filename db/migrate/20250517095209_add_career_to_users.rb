class AddCareerToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :career, :string
  end
end

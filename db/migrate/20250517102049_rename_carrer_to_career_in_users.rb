class RenameCarrerToCareerInUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users,:carrer, :career
  end
end


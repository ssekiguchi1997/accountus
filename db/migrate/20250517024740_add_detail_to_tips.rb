class AddDetailToTips < ActiveRecord::Migration[6.1]
  def change
    add_column :tips, :detail, :text
  end
end

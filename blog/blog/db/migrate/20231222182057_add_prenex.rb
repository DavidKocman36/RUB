class AddPrenex < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :prenex, :string
  end
end

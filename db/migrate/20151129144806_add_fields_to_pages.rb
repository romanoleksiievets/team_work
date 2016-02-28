class AddFieldsToPages < ActiveRecord::Migration
  def change
    add_column :pages, :position, :integer
    add_column :pages, :url, :string
    rename_column :pages, :if_show, :visible
    change_column_default :pages, :visible, false
  end
end

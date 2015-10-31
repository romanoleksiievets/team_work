class AddCheckToShowPage < ActiveRecord::Migration
  def change
    add_column :pages, :if_show, :boolean
  end
end

class CreateNews < ActiveRecord::Migration
  def change
    create_table :newes do |t|
      t.string :title
      t.text    :body
      t.string :tag
      t.timestamps null: false
    end
  end
end

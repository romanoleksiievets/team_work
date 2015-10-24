class CreateNovelties < ActiveRecord::Migration
  def change
    create_table :novelties do |t|
      t.string :title
      t.text    :body
      t.string :tag, default: "none"
      t.integer :novelty_category_id
      t.timestamps null: false
    end
  end
end

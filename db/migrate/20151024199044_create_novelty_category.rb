class CreateNoveltyCategory < ActiveRecord::Migration
  def change
    create_table :novelty_categories do |t|
      t.string :name
      t.string :color
      t.timestamps null: false
    end
  end
end

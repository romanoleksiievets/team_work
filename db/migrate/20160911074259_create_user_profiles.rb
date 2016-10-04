class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.references :user, index: true, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.integer :org_role, default: 0
      t.string :teaching_courses
      t.timestamps null: false
    end
  end
end

class UpdateFieldsInUsers < ActiveRecord::Migration
  def change
    User.find_each do |user|
      user.build_profile unless user.profile
      user.profile.first_name, user.profile.last_name = user.name.split
      user.save(validate: false)
    end

    add_column :users, :mobile, :string
    add_column :users, :about, :text
    remove_column :users, :name, :string
  end
end

class AddDetailsToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :owner, index: true
  end
end

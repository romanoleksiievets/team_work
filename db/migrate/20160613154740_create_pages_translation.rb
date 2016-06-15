class CreatePagesTranslation < ActiveRecord::Migration
  def up
    Page.create_translation_table!({
      title: :string,
      body: :text,
      description: :string
      }, {
        migrate_data: true
      })
    remove_column :pages, :title
    remove_column :pages, :body
    remove_column :pages, :description
  end

  def down
    add_column :pages, :title, :string
    add_column :pages, :body, :text
    add_column :pages, :description, :string
    Page.drop_translation_table! migrate_data: true
  end
end

class AddDefaultPages < ActiveRecord::Migration
  def up
    Page.create(title: "Home", position: 0, url: "home", visible: true, body: "This is home page!")
    Page.create(title: "About us", position: 1, url: "about_us", visible: true, body: "About page!")
    Page.create(title: "Contacts", position: 2, url: "contacts", visible: true, body: "Contact us!")
  end

  def down
    Page.delete_all
  end
end

module ApplicationHelper

  def admin_side?
    controller.class.to_s.include?("Admin::")
  end

  def active_link_to(title, link_path)
    path = request.path == "/" && title == "Home" ? "/" : link_path
    class_name = request.path.include?(path) ? "active" : ""
    content_tag "li", class: class_name do
      link_to title, link_path
    end
  end

  def urls_to_images(s)
        s.gsub! /\s(http:\/\/.*?\.(png|jpg))\s/ ,
                    '<p><img src="\1"/></p>'
        s.html_safe
  end

  def urls_to_links(s)
        s.gsub! /\s(http:\/.*?)\s/ ,
                    '<a href="\1">\1'
        s.html_safe
  end

end

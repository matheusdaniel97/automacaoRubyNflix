class SidebarView
  include Capybara::DSL

  def logged_user
    find(".sidebar-wrapper .user .info span").text #Encontre o texto do elemento com as classes (.sidebar-wrapp...)
  end
end

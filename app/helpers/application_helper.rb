module ApplicationHelper

  BOOTSTRAP_FLASH_MSG = {
    success: 'alert-success',
    error: 'alert-danger',
    alert: 'alert-warning',
    notice: 'alert-info'
  }

  def bootstrap_class_for(flash_type)
    BOOTSTRAP_FLASH_MSG[flash_type]
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      puts "clase bootstrap #{bootstrap_class_for(msg_type.to_sym)}, el msg_type: #{msg_type}"
      concat(
        content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type.to_sym)} fade in") do 
              concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
              concat message 
        end)
    end
    nil
  end

  def title(view_name)
    base_title = ENV['APP_NAME']
    if view_name
      "#{base_title} - #{view_name}"
    else
      base_title
    end
  end

  def navbar
    content_tag :nav, class: 'navbar navbar-default' do
      content_tag :div, class: 'container-fluid' do
        yield
      end
    end
  end

  def info_panel(title, content)
    content_tag :div, class: 'panel panel-info' do
      concat content_tag(:div, title, class: 'panel-heading')
      concat content_tag(:div, content, class: 'panel-body')
    end
  end

end
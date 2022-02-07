module DeviseHelper
  def flash_message
    if flash.any?
      flash.map do |name, message|
        case name
        when 'alert'
          content_tag :div, message, class: 'mt-4 alert alert-danger', role: name
        when 'notice'
          content_tag :div, message, class: 'mt-4 alert alert-success', role: name
        end
      end.join
    end
  end
end

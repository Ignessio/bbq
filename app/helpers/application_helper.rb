module ApplicationHelper
  def user_avatar(user)
    asset_pack_path('media/images/user.png')
  end

  def flash_message(name, message)
    button_close = tag.button(type: "button", class: "btn-close", data: { bs_dismiss: "alert" }, aria: { label: "Close" })
    alert_type = nil
    flash.map do |name, message|
      case name
      when 'alert'
        alert_type = 'alert-danger'
      when 'notice'
        alert_type = 'alert-success'
      end
      tag.div(message, class: "col-md-6 mt-4 alert #{alert_type} alert-dismissible fade show", role: name)
    end.join
  end
end

module ApplicationHelper
  def user_avatar(user)
    asset_pack_path('media/images/user.png')
  end

  def flash_message
    tag.div(id: 'alert') do
      flash.each do |name, message|
        alert_type =
          case name
          when 'alert'
            'alert-danger'
          when 'notice'
            'alert-success'
          end

        concat(tag.div(class: "col-md-6 mt-4 alert #{alert_type} alert-dismissible fade show", role: name) do
          concat(message)
          concat(tag.button(type: 'button', class: 'btn-close', data: { bs_dismiss: 'alert' }, aria: { label: 'Close' }))
        end
        )
      end
    end
  end
end

module ApplicationHelper
  def user_avatar(user)
    asset_pack_path('media/images/user.png')
  end

  def flash_messages(name, message)
    case name
    when "alert"
      <<~FLASH
      <div id="alert" class="col-md-6 mt-4 alert alert-danger alert-dismissible fade show" role="alert">
      #{message}
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
      </div>
      FLASH
    when "notice"
      <<~FLASH
      <div id="alert" class="col-md-6 mt-4 alert alert-success alert-dismissible fade show" role="notice">
      #{message}
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
      </div>
      FLASH
    end
  end
end

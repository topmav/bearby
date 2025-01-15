class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  def after_sign_in_path_for(resource)
    if resource.admin?
      # Admin -> agencies index
      admin_agencies_path
    else
      # Non-admin -> their own agency
      admin_agency_path(resource.agency.uuid)
    end
  end

  private

  def render_flash
    render turbo_stream: turbo_stream.update("flash", partial: "shared/flash")
  end
end
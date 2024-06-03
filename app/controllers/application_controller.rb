class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from CanCan::AccessDenied, with: :access_denied

  private

  def record_not_found
    render plain: '404 Not Found', status: 404
  end

  def access_denied
    redirect_to root_path, alert: 'You are not authorized to perform this action.'
  end
end

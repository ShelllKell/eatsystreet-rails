class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :disable_error_templates

  def disable_error_templates
    response.headers['X-Prohibit-Status-Override'] = 'true'
  end

  private

 def current_bowtie_user_id
   request.headers['HTTP_X_BOWTIE_USER_ID']
 end

end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :check_auth

  #render 404 error
  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
  
  #obj = site/site_page
  #call: authorize!(@site)
  def authorize!(obj)
    if current_user.role != 1
      raise CanCan::AccessDenied.new('没有权限！' )
    end
  end

  private
    def mobile_device?
      request.user_agent =~ /Mobile|webOS/
    end
    helper_method :mobile_device?
    def prepare_for_mobile
      session[:mobile_param] = params[:mobile] if params[:mobile]
    end

    def check_auth
      if current_user
        unless current_user.role == 1
          sign_out current_user
          reset_session
          current_user = nil
          raise CanCan::AccessDenied.new('没有权限！' )
        end
      else
        unless ['devise/sessions'].include? params[:controller]
          raise CanCan::AccessDenied.new('请登录！' )
        end
      end
    end
end

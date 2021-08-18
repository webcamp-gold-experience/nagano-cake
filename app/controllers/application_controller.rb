class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?


  # アカウント登録後のリダイレクト先
    def after_sign_up_path_for(resource)
      root_path
    end

    # ログイン後のリダイレクト先
    def after_sign_in_path_for(resource)
      case resource
       when Customer
         root_path
       when Admin
         admin_root_path
      end
    end

    # ログアウト後のリダイレクト先
    def after_sign_out_path_for(resource)
      root_path
    end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number])
  end


end

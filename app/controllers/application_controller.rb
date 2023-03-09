class ApplicationController < ActionController::Base
# 下記：deviceを使ったときApplicationControllerに必要な記述 
before_action :configure_permitted_parameters, if: :devise_controller?
# (:devise_controller?) deviseにまつわる画面に行った時に、という意味。こうすることで全ての画面でconfigure_permitted_parametersが起動する


  # deviseでログイン機能実装後に、ログイン後の【遷移先】を指定
  def after_sign_in_path_for(resource)
    
    case resource
    when Admin
      # 管理者側がログインした時の【遷移先】：投稿された内容を管理するの画面
      admin_toukens_path
    when User
      # ユーザーがログインした時の【遷移先】：ユーザーホームの画面
      user_path(current_user)
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end


# 下記：deviceを使ったときApplicationControllerに必要な記述
  # この記述は【デバイス版】のストロングパラメーター
  protected
    # デバイスでは初期設定でメールアドレスとパスワードしか許されていない為
    def configure_permitted_parameters
      # [:name]内を編集、追加することでユーザーネームなどを入れることができる。
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
end

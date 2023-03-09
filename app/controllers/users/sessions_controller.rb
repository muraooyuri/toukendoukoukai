class Users::SessionsController < Devise::SessionsController
 
  # ゲストログインのコントローラ
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to user_path(user), notice: 'ゲストでログインしました。'
  end
end
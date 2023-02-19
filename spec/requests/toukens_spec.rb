require 'rails_helper'

RSpec.describe "Toukens", type: :request do
  describe "GET /toukens/new" do
    before do
      #認証ユーザーを作成
      #各変数の中身は何でもOK。passwordとpassword_confirmationが一致することだけ確認する。
      @user = User.create(email: 'test@test.com', password: "password", password_confirmation: "password", name:"testuser")
    end

    it "works! (now write some real specs)" do
      #認証処理を行います
      sign_in @user
      get new_touken_path
      #何を期待する
      expect(response).to have_http_status(200)
    end
    it "works! (now write some real specs)" do
      #認証処理を行います
      get new_touken_path
                                    #３０２をする前に２００で一度Rspecする
      expect(response).to have_http_status(302)
    end
  end
end

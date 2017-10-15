class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def twitter
    puts "twitter---------------"
    # providerとuidでuserレコードを検索。存在しなければ、新たに作成する
    #@user = User.from_omniauth(request.env["omniauth.auth"].except("extra"))
    #
    @user = User.find_for_twitter_oauth(request.env["omniauth.auth"], current_user)

    # userレコードが既に保存されているか
    if @user.persisted?
    #if @user.persisted?
      # ログインに成功
      flash.notice = "Signed in!"
      sign_in_and_redirect @user
      #new_user_registration @user
    else
      #存在してなかったので新しくアカウントを作る
      #user.save
      puts "ssssssssssss elseslelele"
      puts @user.attributes
      flash.notice = "Created account!"
      session["devise.user_attributes"] = @user.attributes
      
      redirect_to new_user_registration_url
      #sign_in_and_redirect(user) and return
    end
  end

  #alias_method :twitter, :all
  #alias_method :facebook, :all
  #alias_method :github, :all
end

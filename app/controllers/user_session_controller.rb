class UserSessionController < ApplicationController
  skip_before_action :authorize
  def new
    redirect_to '/auth/twitter'
  end

  def create
    auth = request.env["omniauth.auth"]
    @user = User.where(:provider => auth['provider'],
                      :uid => auth['uid'].to_s).first || User.create_with_omniauth(auth)
    reset_session
    session[:user_id] = @user.id
    session[:name] = @user.name
    session[:admin] = @user.is_admin
    redirect_to logged_path, :notice => 'Signed in!'
  end
  
  def logout
    @user = User.find(session[:user_id])
    session[:user_id] = nil
    session[:name] = nil
    session[:admin] = nil
    redirect_to root_url
  end  

  def authenticate
    @user = User.find_by(name: params[:username])
    if @user and @user.authenticate(params[:password])
      session[:user_id] = @user.id
      session[:name] = @user.name
      session[:admin] = @user.is_admin
      redirect_to logged_path
    else
      redirect_to root_url, alert: "Invalid user/password combination"
    end
  end

  def destroy
    reset_session
    redirect_to root_url, :notice => 'Signed out!'
  end

  def failure
    redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  end
end

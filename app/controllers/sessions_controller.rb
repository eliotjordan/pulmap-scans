class SessionsController < ApplicationController

  def new
    if ENV['RAILS_RELATIVE_URL_ROOT']
      auth_url = ENV['RAILS_RELATIVE_URL_ROOT'] + '/auth/cas'
    else
      auth_url = '/auth/cas'
    end
   redirect_to auth_url
  end

  def create
    auth = request.env["omniauth.auth"]
    user = User.where(:provider => auth['provider'],
                      :uid => auth['uid'].to_s).first || User.create_with_omniauth(auth)
    reset_session
    session[:user_id] = user.id
    redirect_to root_url, :notice => 'Signed in!'
  end

  def destroy
    reset_session
    redirect_to root_url, :notice => 'Signed out!'
  end

  def failure
    redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  end

end

class LoginController < ApplicationController

  layout 'plain'

  def login
    logger.debug params.inspect
    redirect_to start_overview_path
  end

  def index
  end

  def create
    session[:password] = params[:password]
    #flash[:notice] = &rsquo;Successfully logged in&rsquo;
    redirect_to home_path
  end

  def destroy
    reset_session
    #flash[:notice] = &rsquo;Successfully logged out&rsquo;
    redirect_to login_path
  end

  #require 'digest/sha1'
  #encrypted_password= Digest::SHA1.hexdigest(password)

  #before_filter :require_login
  #skip_before_filter :require_login, only: [:index, :new, :create]
  #skip_before_filter :require_login, except: [:destroy]
end

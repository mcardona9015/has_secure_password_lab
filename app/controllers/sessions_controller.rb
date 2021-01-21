class SessionsController < ApplicationController
    skip_before_action :authorized

    def new
    
    end
  
    def create
      @user = User.find_by(name: params[:name])
  
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to welcome_path
      else
        flash[:message] = "Username or password is incorrect. Please try again."
        redirect_to login_path
      end
    end
  
    def destroy
      session.delete :user_id
      redirect_to login_path
    end

end

class MainController < ApplicationController
    def index
        # flash[:notice] ="Logged in successfully!"
        # flash[:alert] ="Email or password mismatched"

        if session[:user_id]
            #@user =User.find(session[:user_id])
            @user =User.find_by(id: session[:user_id])
        end
    end
end

    
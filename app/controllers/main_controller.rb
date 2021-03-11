class MainController < ApplicationController
    def index
        flash[:notice] ="Logged in successfully!"
        flash[:alert] ="Email or password mismatched"
    end
end

    
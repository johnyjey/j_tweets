class PasswordResetsController < ApplicationController
    def new
        
    end
    def create 
        @user = User.find_by(email: params[:email])
        if @user.present?
            # Send Email

             #PasswordMailer.with(user: @user).reset.deliver_later      # Not disturbing the application
             PasswordMailer.with(user: @user).reset.deliver_now         # will take time to connect email server and get the response
        #else
            #redirect_to password_reset_path,notice: "Sorry, No user found with this email."
        end
        
        redirect_to root_path, notice: "If an account with this email was found, We have sent a link to reser your password"
    end
 
    def edit
        #@user = User.find_signed(params[:token], purpose: "Password Reset")
        @user = User.find_signed(params[:token], purpose: "password_reset") # ????????????????
    rescue ActiveSupport::MessageVerifier::InvalidSignature
        redirect_to sign_in_path, alert: "Your token has expired. Please try again."
    end

    def update
        @user = User.find_signed!(params[:token], purpose: "password_reset") # ???????????????
        if @user.update(password_params)
            redirect_to sign_in_path, notice: "Your password was reset successfully. Please sign in."
        else
            render :edit
        end
    end

    private

    def password_params
        params.require(:user).permit(:password, :password_confirmation) 
    end
    
end

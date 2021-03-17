class RegistrationsController < ApplicationController
    def new
        @user=User.new
    end

    def create
        #render plain: "Logged In!" ## Print text
        #render plain: params[:user] ## Print the parameters
        #params
        # =>{"authenticity_token"=>"[FILTERED]", "user"=>{"name"=>"John Palson J", "email"=>"johnjpalson@gmail.com", "password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]"}, "commit"=>"Sign Up"}
        #params[:user]
        # =>{email"=>"johnjpalson@gmail.com", "password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]"}}
        
        #@user =User.new(params[:user])

        @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id
          #redirect_to root_path, notice: "Successfully created account"
          redirect_to sign_up_path, notice: "Congrats! You have created account successfully. Please keep in touch with us for updates"
        else
          flash[:alert] ="Something was wrong"
          render :new
        end
    end

        
    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end

class TwitterAccountsController < ApplicationController
    before_action :require_user_logged_in!
    #before_action :set_twitter_account,only: [:show :destroy]
    before_action :set_twitter_account,only: [:destroy]

    def set_twitter_account
        @twitter_account = Current.user.twitter_accounts.find(params[:id])
    end
    
    def index
        @twitter_accounts = Current.user.twitter_accounts
    end

    # def show
        ## Test Code here
    # end

    def destroy
        
        #@twitter_account = Current.user.twitter_accounts.find(params[:id])
        @twitter_account.destroy
        redirect_to twitter_accounts_path, notice: "Successfully Disconnected @#{@twitter_account.username}"
    end

end
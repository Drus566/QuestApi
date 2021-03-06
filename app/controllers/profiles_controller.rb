class ProfilesController < ApplicationController
    before_action :authenticate_user
    
    def index
        @profiles = Profile.all
        render json: @profiles
    end

    def show
        @user = User.find(params[:id])
        @profile = @user.profile
        render json: @profile
    end
end

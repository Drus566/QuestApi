class Api::QuestsController < ApplicationController
    def index
        @quests = Quest.all
        render json: @quests
    end

    def show
        @quest = Quest.find(params[:id])
        render json: @quest
    end
end

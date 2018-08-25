class RoomsController < ApplicationController
    before_action :authenticate_user
    before_action :set_room, only: [ :update, :destroy ]

    def index
        rooms = Room.all
        render json: rooms
    end

    def find_player
        first_player = current_user
        if second_player = User.where(ready: true, `id != #{first_player.id}`).first
            second_player.update(:ready => 'false')
            render json: second_player.id, status: :ok
        else
            first_player.update(:ready => 'true')
            render status: :not_found
        end
    end
    
    def create
        @room = Room.new(room_params)
        if @room.save
            render json: @room, status: :created
        else
            render json: @room.errors, status: :unprocessable_entity
        end
    end

    def update
        if check_user(@room)
            if @room.update(rooms_update_params)
                get_room_rounds
            else
                render json: @room.errors, status: :unprocessable_entity
            end
        else
            render status: :unauthorized 
        end
    end

    def destroy
        if check_user(@room)
            @room.destroy
            render status: :ok
        else
            render status: :unauthorized
        end
    end

    def get_user_rooms
        user = User.find(params[:id])
        data = user.room_first_user_id + user.room_second_user_id
        render json: data
    end
    
    def get_room_rounds
        render json:  
        {   
            fisrt_round: @room.first_round,
            second_round: @room.second_round,
            third_round: @room.third_round,
            completed: @room.completed
        }
    end

    private 

        def set_room
            @room = Room.find(params[:id])
        end

        def room_params
            params.require(:room).permit(:first_user_id, :second_user_id)
        end

        def user_params
            params.require(:user).permit(:id)
        end

        def rooms_update_params
            params.require(:room).permit(:first_round, :second_round, :third_round, :completed)
        end

        def check_user(room)
            if ((current_user.id == room.first_user_id) || (current_user.id == room.second_user_id))
                return true
            else
                return false
            end
        end

        # Подсчет (не)успешных ответов
        # def counter(x,y)
        #     success = 0
        #     unsuccessfully = 0 
        #     for i in x..y
        #         if string[i] == 1
        #             success++
        #         else string[i] == 0
        #             unsuccessfully++
        #         end
        #     end
        #     @result = success + "" + unsuccessfully
        # end

        # def complete()
        #     if()
        # end

        # def parse_string(string, room)
        #     if (string.present? && !string.blank? && (string.size == 9 || string.size == 8))
        #         # f001s001c
        #         if current_user == room.first_user_id
        #             if string[1] = 'w'
                        
        #             else
        #                 counter(1,3)
        #             end
        #         elsif current_user == room.second_user_id
        #             if string[5] = 'w'

        #             else
        #                 counter(5,7)
        #             end
        #         else
        #             render status: :unprocessable_entity
        #         end
        #     end
        # end
end


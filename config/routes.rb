Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #users_controller
  get 'users/check_user' => 'users#check_user'

  #user_token_controller
  post 'user_token' => 'user_token#create'

  #rooms_controller
  get 'rooms/get_user_rooms/:id' => 'rooms#get_user_rooms'
  get 'rooms/get_room_rounds' => 'rooms#get_room_rounds'
  post 'find_player' => 'rooms#find_player'

  resources :users
  resources :quests
  resources :profiles
  resources :rooms
end

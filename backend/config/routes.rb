Rails.application.routes.draw do
  shallow do
    resources :tables do
      member do
        get 'sit'
        get 'eat'
        get 'clear'
        post 'left_neighbor'
        post 'right_neighbor'
        post 'my_left_fork'
        post 'my_right_fork'
        get 'seated'
      end

      resources :forks do
        member do
          get 'pick_up'
          get 'put_down'
          post 'give_to'
          get 'clean'
        end
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :admins, controllers: {
    registrations: 'admin/registrations',
    sessions: 'admin/sessions',
    passwords: 'admin/passwords'
  }

  devise_for :members, controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions',
    passwords: 'public/passwords'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope module: 'public' do

    root to: "homes#top"

    get "/about" => "homes#about"

    get "members/unsubscribe" => "members#unsubscribe"

    patch "members/withdraw" => "members#withdraw"

    resources :problems, except: [:edit, :update] do
      resources :advices, only: [:create, :destroy] do
        resources :responses, only: [:create, :destroy]
        resource :favorites, only: [:create, :destroy]
      end
    end

    get '/searches' => "searches#search"

  end


  # namespace :admin do
  # end

end

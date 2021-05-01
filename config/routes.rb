Rails.application.routes.draw do
  devise_for :admin, controllers: {
    registrations: 'admin/registrations',
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
  }

  devise_for :members, controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions',
    passwords: 'public/passwords',
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
    get "/" => "homes#top"

    resources :categories, only: [:index, :create, :edit, :update]

    resources :members, only: [:index, :show, :edit, :update]
  end

  scope module: 'public' do
    root to: "homes#top"

    post "members/guest_sign_in" => "members#guest_sign_in"

    get "/about" => "homes#about"

    get "members/unsubscribe" => "members#unsubscribe"

    patch "members/withdraw" => "members#withdraw"

    resources :problems, except: [:edit, :update] do
      resources :advices, only: [:new, :create, :destroy] do
        resources :responses, only: [:new, :create, :destroy]
        resource :favorites, only: [:create, :destroy]
      end
    end

    resources :categories, only: [:index, :show]

    get '/searches' => "searches#search"
  end
end

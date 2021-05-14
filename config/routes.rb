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

    get "/about" => "homes#about"

    get "members/my_page" => "members#show"

    get "members/my_page/edit" => "members#edit"

    patch "members/my_page" => "members#update"

    get "members/unsubscribe" => "members#unsubscribe"

    patch "members/withdraw" => "members#withdraw"

    post "members/guest_sign_in" => "members#guest_sign_in"

    resources :problems, except: [:edit, :update] do
      resources :advices, only: [:new, :create, :destroy] do
        resources :responses, only: [:new, :create, :destroy]
        resource :favorites, only: [:create, :destroy]
      end
    end

    resources :categories, only: [:index, :show]

    resource :contacts, only: [:new, :create]

    get '/searches' => "searches#search"
  end
end

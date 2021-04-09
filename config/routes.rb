Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope module: 'public' do

    root to: "homes#top"

    get "/about" => "homes#about"

    resources :members, only: [:edit, :update] do
      member do
        get 'unsubscribe'
        patch 'withdraw'
      end
    end

  end

  devise_for :members, controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

end

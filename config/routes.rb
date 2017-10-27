Rails.application.routes.draw do
  #devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: :private do
    resources :articles

    namespace :settings do
      resource :withdrawals
      resource :profiles
      resource :accounts
      resource :passwords
    end
  end


  #scope 'user' do
  #  scope module: :publish do
  #    resource :articles, only: [:index, :show]
  #  end
  #end


  scope module: :publish do
  #namespace :publish do
    resources :comments
  end
  #scope module: :publish do
  #  scope 'user' do
  #    resources :articles, only: [:index, :show]
  #  end
  #end

  #scope module: :publish do
  #  scope 'user' do
  #    resource :articles
  #  end
  #end


  #resources :user, only: [:index, :show] do
  #  scope module: :publish do
  #    resources :articles, only: [:index, :show] do
  #    end
  #  end 
  #end


  resources :user, only: [:index, :show] do
    scope module: :publish do
      resources :articles, only: [:index, :show]
    end 
  end

  #devise_for :users,
  #  controllers: {
  #    registrations: 'regists',
  #  }
  #
  
  #resources :user, only: [:index, :show] do
  #  scope module: :publish do
  #    resoures :articles, only: [:index, :show]
  #  end
  #end

  #resources 
  devise_for :users,
    controllers: {
      registrations: 'regists',
      omniauth_callbacks: 'omniauth_callbacks',
    }

  root 'welcome#index'
end

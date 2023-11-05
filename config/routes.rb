Rails.application.routes.draw do

  scope module: :public do
    root to: "homes#top"

    resource :customers, only:[:edit, :update] do
      get "mypage" => "customers#show"
      get "unsubscribe" => "customers#unsubscribe"
      patch "quit" => "customers#quit"
    end

    resources :reservations, only:[:index, :new, :create, :destroy] do
      get "complete" => "reservations#complete"
    end

    resources :menus, only:[:index]

    resources :notices, only:[:index, :create] do
      collection do
        get "show" => "notices#show"
        patch "update" => "notices#update"
        delete "destroy" => "notices#destroy"
      end
    end
  end

  namespace :admin do
    root to: "homes#top"

    resources :menus, only:[:index, :new, :create, :destroy]

    resources :notices, only:[:index, :show, :new, :create, :update, :destroy]

    resources :customers, only:[:index]

    resources :reservations, only:[:index]
  end

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers, controllers: {
  　registrations: "public/registrations",
  　sessions: "public/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

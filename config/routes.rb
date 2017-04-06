Rails.application.routes.draw do
  resources :companies do
    resources :jobs
    resources :contacts, only: [:create]
  end

  resources :jobs, only: [:show] do
    resources :comments, only: [:create]
  end

  resources :categories

  get 'jobs' => 'jobs#root'
end

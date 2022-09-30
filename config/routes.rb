Rails.application.routes.draw do
  #get 'welcomes/home'
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root 'welcomes#home'
  

  resources :users do
    resources :breaks
  end


  resources :users do
    resources :salaries
  end

  resources :users do
    resources :emp_attendances
  end

  resources :users do
    resources :projects
  end
  
   resources :holidays

  get 'project/:user_id' => 'users#new', as: :project

end

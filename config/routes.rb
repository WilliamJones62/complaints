Rails.application.routes.draw do
  get 'complaints/showimage/:id'  => 'complaints#showimage'
  resources :complaints do
    collection { post :import }
    resources :complaint_images, except: [:index, :show]
  end
  devise_for :users
  root 'complaints#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

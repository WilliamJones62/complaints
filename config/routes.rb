Rails.application.routes.draw do
  get 'complaints/showimage/:id'  => 'complaints#showimage'
  get 'complaints/chosen'
  get 'complaints/summary'
  get 'complaints/inactive'
  resources :complaints do
    collection { post :import }
    resources :complaint_images
  end
  resources :employee_lists do
    collection { post :import }
  end
  root 'complaints#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

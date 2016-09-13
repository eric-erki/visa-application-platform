Rails.application.routes.draw do

  get 'statuses/create'

  root 'top#index'

  resources :sessions
  resources :messages
  resources :top
  resources :staffs
  resources :applicants
  resources :statuses

  resources 'visas' do
    get 'management', on: :collection
    post 'search', on: :collection
    get 'set_visa_type_options', on: :collection
    get 'check_applicant_info', on: :collection
  end
  
end

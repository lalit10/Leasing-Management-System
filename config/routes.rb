Rails.application.routes.draw do

  devise_for :applicants,controllers: { sessions: 'applicants/sessions', registrations: 'applicants/registrations'}
  devise_for :admins, controllers: { sessions: 'admins/sessions', registrations: 'admins/registrations'}
  devise_for :leasing_agents, controllers: { sessions: 'leasing_agents/sessions', registrations: 'leasing_agents/registrations'}


  resources :waitlists
  resources :applications
  resources :properties
  resources :admins
  resources :applicants
  resources :leasing_agents
  root 'home#index'
  devise_scope :leasing_agents do
    get '/users/sign_out' => 'devise/sessions#destroy'
    end
    devise_scope :admin do
      get '/admin/sign_out' => 'devise/sessions#destroy'
    end
  devise_scope :applicants do
    get '/applicants/sign_out' => 'devise/sessions#destroy'
  end


  get 'signup', to: "users#new", as: 'signup'
  get 'login', to: "sessions#new", as: 'login'
  get 'logout', to: "sessions#destroy", as: 'logout'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'getallProperties' => 'properties#getallproperties', :as => :getallproperties
  get 'tenantcheckin' => 'properties#checkin', :as => :tenantcheckin
  get 'tenantcheckout' => 'properties#checkout', :as => :tenantcheckout
  get 'tenantapproval' => 'properties#approval', :as => :tenantapproval
  get '/show_leasing_agents' => 'admins#show_leasing_agents', :as => 'show_leasing_agents'
  get '/show_properties' => 'admins#show_properties', :as => 'show_properties'
  get '/show_applicants' => 'admins#show_applicants', :as => 'show_applicants'
  get '/show_applications' => 'admins#show_applications', :as => 'show_applications'
  get '/add_applications' => 'applications#admin_application', :as => 'add_applications'
  get '/add_properties' => 'properties#admin_properties', :as => 'add_properties'

  get 'getproperties' => 'leasing_agents#getproperties', :as => :getproperties
  get 'checkin' => 'applications#checkin', :as => :checkin
  get 'checkout' => 'applications#checkout', :as => :checkout
  get 'reject' => 'applications#reject', :as => :reject

  get 'moveout'=> 'properties#moveout', :as => :moveout

end


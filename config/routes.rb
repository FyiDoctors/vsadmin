Vsmembership::Application.routes.draw do
  resources :taxes

  resources :fees

  resources :clinics
  resources :reports, :except => [:new, :create, :delete]
  resources :models, :except => [:index, :new, :create, :delete]
  resources :membership_fees, :except => [:delete] do
    get :autocomplete_clinic_name, :on => :collection
  end
  
  resources :securities
  
  root :to => "home#index"
end

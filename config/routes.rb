Vsmembership::Application.routes.draw do
  resources :fees

  resources :clinics
  resources :reports, :except => [:new, :create, :delete]
  resources :membership_fees, :except => [:index, :delete] do
    get :autocomplete_clinic_name, :on => :collection
  end
  
  resources :securities
  
  root :to => "home#index"
end

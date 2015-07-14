Lodgerapp::Application.routes.draw do
	devise_for :users
	root to: "properties#index"

  resources :properties do
	get 'vacant', :on => :collection
	resources :tenants
  end

	resources :tenants do
		get 'current', :on => :collection
	end
end

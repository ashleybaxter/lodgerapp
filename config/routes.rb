Lodgerapp::Application.routes.draw do
  devise_for :users
	root to: "properties#index"

  resources :properties

	resources :tenants do
		get 'current', :on => :collection
	end
end

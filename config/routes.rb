Lodgerapp::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
	devise_for :users, :skip => [:registrations] 
	as :user do
		get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
		put 'users' => 'devise/registrations#update', :as => 'user_registration'
	end
	root to: "properties#index"

	resources :properties do
		get 'vacant', :on => :collection
		resources :tenants
	end

	resources :tenants do
		get 'current', :on => :collection
	end
end

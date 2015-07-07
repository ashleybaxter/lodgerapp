Lodgerapp::Application.routes.draw do
  devise_for :users
	root to: "properties#index"

  resources :properties
end

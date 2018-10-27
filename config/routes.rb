Rails.application.routes.draw do
  get 'search/index'

  get 'main/index'

  get 'welcome/index'

  get 'search/results'

  get 'search/refer'

  resources :hospitals
  resources :beds

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

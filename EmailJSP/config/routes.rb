Rails.application.routes.draw do
  post 'user/show'

  post 'user/new'

  post 'user/edit'

  post 'user/destroy'

  get 'welcome/index'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

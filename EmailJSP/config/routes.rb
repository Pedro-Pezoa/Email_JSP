Rails.application.routes.draw do
  post 'email/show'
  post 'email/new'
  post 'email/edit'
  post 'email/destroy'

  post 'user/show'
  post 'user/new'
  post 'user/edit'
  post 'user/destroy'

  get 'welcome/index'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

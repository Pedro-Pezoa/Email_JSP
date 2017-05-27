Rails.application.routes.draw do
  post 'api/email/show'
  post 'api/email/new'
  post 'api/email/edit'
  post 'api/email/destroy'

  post 'api/user/show'
  post 'api/user/new'
  post 'api/user/edit'
  post 'api/user/destroy'

  get 'welcome/index'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

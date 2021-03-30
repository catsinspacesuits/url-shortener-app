Rails.application.routes.draw do
  root 'urls#new'
  get '/:short_url', to: 'urls#redirect_to_original'
  resources :urls, only: [:new, :create, :show]
end

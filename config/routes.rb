Rails.application.routes.draw do
  get 'enqueue', to: 'sample#enqueue'
  get 'sample', to: 'sample#index'
end

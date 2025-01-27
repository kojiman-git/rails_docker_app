Rails.application.routes.draw do
  get 'enqueue', to: 'sample#enqueue'
  get 'enqueue2', to: 'sample#enqueue2'
  get 'sample', to: 'sample#index'
end

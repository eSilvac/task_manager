Rails.application.routes.draw do
  get '/',  to: 'task_manager#index', as: 'home_root'

  resources :task_manager, only: %i[create destroy]
end

Rails.application.routes.draw do
  get '/',  to: 'task_manager#index'

  resources :task_manager, only: %i[create destroy]
end

Rails.application.routes.draw do
  get 'home/index'

  get  '/upload' => 'uploads#upload'
  post '/upload' => 'uploads#send_upload', as: :send_upload

  root to: 'home#index'
end

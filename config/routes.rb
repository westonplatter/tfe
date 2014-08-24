Rails.application.routes.draw do
  get  'calls/upload' => 'calls#upload'
  post 'calls/send_upload' => 'calls#send_upload'

  get  '/upload' => 'uploads#upload'
  post '/upload' => 'uploads#send_upload', as: :send_upload

  get 'home/index'
  root to: 'home#index'
end

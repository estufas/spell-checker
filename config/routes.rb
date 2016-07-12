Rails.application.routes.draw do

   root 'index#index'

   get 'results' => 'index#results'
  
end

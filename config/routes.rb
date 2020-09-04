Rails.application.routes.draw do
  root "books#top"
  resources :books
  patch "books/:id" => "books#update", as: "update_book"
  delete "books/:id" => "books#destroy", as: "destroy_book"
  # get "/books" => "books#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

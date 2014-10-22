Rails.application.routes.draw do
  root 'home#index'
  match '*path' => 'application#error404', via: :all
end


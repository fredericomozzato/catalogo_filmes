Rails.application.routes.draw do
  root "main#index"
  resources(:genres)
  resources(:directors)
  resources(:movies)
end

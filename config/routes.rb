Rails.application.routes.draw do
  root "movies#index"
  resources(:genres)
  resources(:directors)
  resources(:movies)
end

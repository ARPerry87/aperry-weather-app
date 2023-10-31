Rails.application.routes.draw do
  root 'forecasts#index'
  get 'forecasts/index'
end

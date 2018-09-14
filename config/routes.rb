Rails.application.routes.draw do
  resources :commands
  root to: redirect("/commands")
end

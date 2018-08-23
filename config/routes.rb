Rails.application.routes.draw do
  constraints subdomain: "api" do
    scope module: "api" do
      namespace :v1 do
        resources :registrations
      end
    end
  end
  resources :registrations

end

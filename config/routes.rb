Rails.application.routes.draw do
  devise_for :managers

  authenticated :manager do
    root "manager_top_pages#home", as: :manager_authenticated_root
  end

  root "static_pages#home"
end

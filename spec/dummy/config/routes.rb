Rails.application.routes.draw do
  resources :pages
  resources :page_templates
  resources :styles do
    member do
      put :preview_template
      put :publish_template
    end
  end
  resources :body_styles
end

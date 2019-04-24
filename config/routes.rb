Rails.application.routes.draw do
    resources :chatbot, only: [:index, :create], defaults: { format: 'json' } do
    end
end

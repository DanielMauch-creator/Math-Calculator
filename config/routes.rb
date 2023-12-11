# frozen_string_literal: true

Rails.application.routes.draw do
  root 'calculators#index'
  get "/calculations", to: "calculations#index"

  resources :calculators do
    resources :calculations
  end
end

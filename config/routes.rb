Cms::Pages::Engine.routes.draw do
  namespace :admin do
    resources :pages
    root :to => 'pages#index'
  end

  match '/:url' => 'pages#show', :constraints => {:url => /.*/}
end

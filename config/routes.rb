Rails.application.routes.draw do
 root to: 'tasks#top'
 resources :tasks do
     collection do
       post :confirm
     end
   end
end

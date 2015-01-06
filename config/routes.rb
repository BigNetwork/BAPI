Rails.application.routes.draw do

  resources :events do
    resources :news_posts do
      resources :comments
    end
    #resources :faqs
    #resources :happenings
    #resources :groups
    #resources :seat_maps do
      #resources :seat_map_areas
      #resources :table_rows do
        #resources :seats
      #end
    #end
    #resources :ticket_types
    #resources :ticket_prices
    #resources :orders
    #resources :payments
  end

  resources :users #do
    #resources :news_posts
    #resources :comments
    #resoucres :orders
    #resources :tickets
    #resources :seats
    #resources :groups
    #resources :achievements
    #resource  :level
  #end

end

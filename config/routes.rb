Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get("/", { :controller => "currency", :action => "homepage"})

  get("/forex", { :controller => "currency", :action => "currency_display"})
  get("/forex/:from_symbol", { :controller => "currency", :action => "forex_display"})
  get("/forex/:from_symbol/:to_symbol", { :controller => "currency", :action => "forex_calculation"})

  get("/covid", { :controller => "currency", :action => "covid"})
end

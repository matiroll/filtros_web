ActionController::Routing::Routes.draw do |map|
  map.resources :lista_precios

  map.resources :lista_precios

  map.resources :lista_precios

  map.resources :filtro_vehiculos

  map.resources :vehiculos
  
  map.resources :indices
  
  map.resources :backoffices   

  map.resources :marca_vehiculos

  map.resources :account

  map.resources :tipo_vehiculos

  map.resources :tipo_filtros

  map.resources :usuarios

  map.resources :equivalencias

  map.resources :imagens

  map.resources :filtros
  
  map.connect '/articulos', :controller => 'indices', :action => 'articulos'
  map.connect '/calidad_filtros_hasting', :controller => 'indices', :action => 'calidad_filtros_hasting'
  map.connect '/catalogo_online', :controller => 'indices', :action => 'catalogo_online'
  map.connect '/certificado_iso', :controller => 'indices', :action => 'certificado_iso'
  map.connect '/contacto', :controller => 'indices', :action => 'contacto'
  map.connect '/filtro_de_aceite', :controller => 'indices', :action => 'filtro_de_aceite'
  map.connect '/filtro_de_aire', :controller => 'indices', :action => 'filtro_de_aire'
  map.connect '/filtro_de_combustible', :controller => 'indices', :action => 'filtro_de_combustible'
  map.connect '/filtro_de_habitaculo', :controller => 'indices', :action => 'filtro_de_habitaculo'
  map.connect '/filtro_especiales', :controller => 'indices', :action => 'filtro_especiales'
  map.connect '/historia', :controller => 'indices', :action => 'historia'
  map.connect '/lista_de_precios', :controller => 'indices', :action => 'lista_de_precios'  


 map.connect '/upload', :controller => 'upload', :action => 'get'  
 map.connect '/uploadNew', :controller => 'upload', :action => 'getNew' 
 
 map.connect '/tipo_v/:id', :controller => 'indices', :action => 'tipo_vehiculo'


  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
   map.root :controller => "indices"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end

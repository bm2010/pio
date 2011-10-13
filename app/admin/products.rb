ActiveAdmin.register Product do
  
  
  collection_action :import_csv, :method => :post do
        # Do some CSV importing work here...
        redirect_to :action => :index, :notice => "CSV imported successfully!"
      end
      
      
  # index do
  #     column "Hersteller", :manufacturer
  #     column "Gruppe", :group
  #     column "Kategorie", :category
  #     column "Produktbezeichnung", :product
  #     column "Info", :info
  #     column :purchase_price, :sortable => :purchase_price do |product|
  #       div :class => "price" do
  #         number_to_currency(product.purchase_price, :locale => :de)
  #       end
  #     end
  #     default_actions
  #   end
    
    
  
  
end



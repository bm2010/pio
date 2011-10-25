require 'csv'
ActiveAdmin.register Product do
  
      index do
          column "Hersteller", :manufacturer
          column "Gruppe", :group
          column "Kategorie", :category
          column "Produkt", :product
          column "Info", :info
          column "PP", :purchase_price, :sortable => :purchase_price do |product|
            div :class => "price" do
              number_to_currency(product.purchase_price, :locale => :de)
            end
          end
          column "SP", :sales_price, :sortable => :sales_price do |product|
            div :class => "price" do
              number_to_currency(product.sales_price, :locale => :de)
            end
          end
          default_actions
        end

        sidebar :product, :partial => "debug"


        action_item :only => :index do
           link_to 'Upload products', :action => 'upload_csv'
         end

         collection_action :upload_csv do
           # The method defaults to :get
           # By default Active Admin will look for a view file with the same
           # name as the action, so you need to create your view at
           # app/views/admin/posts/upload_csv.html.haml (or .erb if that's your weapon)
         end

         collection_action :import_csv, :method => :post do
           file = params[:file]
           
           CSV.foreach(file.tempfile, :headers => true) do |row|
            Product.create!(
                            :manufacturer_id => row[0],
                            :group_id => row[1],
                            :category_id => row[2],
                            :product => row[3],
                            :info => row[4],
                            :purchase_price => row[5],
                            :sales_price => row[6]
                            )
          end
           redirect_to :action => :index, :notice => "CSV imported successfully!"
         end
  
end



require 'csv'
ActiveAdmin.register Category do
   index do
        column "ID", :id
        column "Hersteller", :manufacturer
        column "Kategorie", :name
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
          Category.create!(
                          :manufacturer_id => row[0],
                          :name => row[1]
                          )
        end
         redirect_to :action => :index, :notice => "CSV imported successfully!"
       end
end

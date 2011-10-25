require 'csv'
ActiveAdmin.register Group do
  

  sidebar :product, :partial => "debug"

  action_item :only => :index do
           link_to 'Upload Groups', :action => 'upload_csv'
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
	    Group.create!(
	                    :name => row[0],
	                    :manufacturer_id => row[1]
	                    )
	  end
	  flash.now[:notice]="CSV Import Successful."
	  redirect_to :action => :index, #:notice => "CSV imported successfully!"
  	end

end

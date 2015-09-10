RailsAdmin.config do |config|

  config.current_user_method { current_user } 

  config.authorize_with :cancan

  config.excluded_models << "Image"

  config.model "User" do
    list do
      configure :provider do
        hide
      end
    end
    edit do
      field :name do
        label 'Full Name'
        help ''
      end
      field :role do 
        label 'Role'
        help ''
      end
      field :uid do 
        label 'NetID'
        help ''
      end
    end
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    bulk_delete
    show
    edit
    delete

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end

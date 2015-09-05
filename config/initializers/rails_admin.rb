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
      field :name
      field :role
      field :uid
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

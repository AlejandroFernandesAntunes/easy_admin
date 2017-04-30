RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  config.show_gravatar = false

  config.included_models = %w(Notification Requirement Service User)
  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    # export
    bulk_delete
    show
    edit
    delete
    # show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model Notification do
    edit do
      field :title
      field :body, :ck_editor
    end

    list do
      field :title
      field :created_at do
        label 'Date'
      end
    end

    show do
      field :title
      field :created_at do
        label 'Date'
      end
      field :body
    end
  end

  config.model Requirement do
    list do
      field :title
      field :resolved
    end

    edit do
      field :title
      field :body, :text
      field :resolved do
        read_only do
          %w(regular).include?(
            bindings[:controller].current_user.role)
        end
      end
      field :resolution do
        read_only do
          %w(regular).include?(
            bindings[:controller].current_user.role)
        end
      end
    end

    show do
      field :title
      field :body
      field :resolution
      field :resolved
    end
  end

  config.model Service do
    list do
      field :kind
      field :name
      field :phone_number
      field :observation
    end

    edit do
      field :kind
      field :name
      field :phone_number
      field :observation, :text
    end
  end

  config.model User do
    visible do
      %w(regular).exclude?(
        bindings[:controller].current_user.role)
    end
    list do
      field :name
      field :email
      field :apartment_number
      field :phone_number
    end

    edit do
      group :registration do
        field :email
        field :password
        field :password_confirmation
        field :role, :enum do
          enum do
            User.roles
          end
          visible do
            %w(regular).exclude?(
              bindings[:controller].current_user.role)
          end
        end
      end
      group :personal_data do
        field :name
        field :apartment_number
        field :phone_number
      end
    end

    show do
      field :email
      field :name
      field :apartment_number
      field :phone_number
    end
  end
end

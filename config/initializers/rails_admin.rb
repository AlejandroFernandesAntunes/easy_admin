RailsAdmin.config do |config|
  config.main_app_name = ["Luna Azul I", "EasyAdmininstrator"]
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
    label 'Notificación'
    label_plural 'Notificaciones'
    edit do
      field :title do
        label 'Título'
      end
      field :body, :ck_editor do
        label 'Cuerpo'
      end
    end

    list do
      field :title do
        label 'Título'
      end
      field :created_at do
        label 'Fecha'
      end
    end

    show do
      field :title do
        label 'Título'
      end
      field :created_at do
        label 'Fecha'
      end
      field :body do
        label 'Cuerpo'
      end
    end
  end

  config.model Requirement do
    label 'Requerimiento'
    label_plural 'Requerimientos'
    list do
      field :title do
        label 'Título'
      end
      field :resolved do
        label 'Resuelto?'
      end
      field :resolution do
        label 'Solución'
      end
    end

    edit do
      field :title do
        label 'Título'
      end
      field :body, :text do
        label 'Cuerpo'
      end
      field :resolved do
        label 'Resuelto?'
        read_only do
          %w(regular).include?(
            bindings[:controller].current_user.role)
        end
      end
      field :resolution do
        label 'Solución'
        read_only do
          %w(regular).include?(
            bindings[:controller].current_user.role)
        end
      end
    end

    show do
      field :title do
        label 'Título'
      end
      field :body do
        label 'Cuerpo'
      end
      field :resolution do
        label 'Solución'
      end
      field :resolved do
        label 'Resuelto?'
      end
    end
  end

  config.model Service do
    label 'Servicio'
    label_plural 'Servicios'
    list do
      field :kind do
        label 'Tipo de servicio'
      end
      field :name do
        label 'Nombre'
      end
      field :phone_number do
        label 'Número de teléfono'
      end
      field :observation do
        label 'Observaciones'
      end
    end

    edit do
      field :kind do
        label 'Tipo de servicio'
      end
      field :name do
        label 'Nombre'
      end
      field :phone_number do
        label 'Número de teléfono'
      end
      field :observation, :text do
        label 'Observaciones'
      end
    end
  end

  config.model User do
    label 'Usuario'
    label_plural 'Usuarios'
    visible do
      %w(regular).exclude?(
        bindings[:controller].current_user.role)
    end
    list do
      field :name do
        label 'Nombre'
      end
      field :email do
        label 'Email'
      end
      field :apartment_number do
        label 'Apartamento'
      end
      field :phone_number do
        label 'Número de teléfono'
      end
    end

    edit do
      group :registration do
        label 'Información de registro'
        field :email do
          label 'Email'
        end
        field :password do
          label 'Contraseña'
        end
        field :password_confirmation do
          label 'Confirmación de contr.'
        end
        field :role, :enum do
          label 'Rol'
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
        label 'Información personal'
        field :name do
          label 'Nombre'
        end
        field :apartment_number do
          label 'Apartamento'
        end
        field :phone_number do
          label 'Número de teléfono'
        end
      end
    end

    show do
      field :email do
        label 'Email'
      end
      field :name do
        label 'Nombre'
      end
      field :apartment_number do
        label 'Apartamento'
      end
      field :phone_number do
        label 'Número de teléfono'
      end
    end
  end
end

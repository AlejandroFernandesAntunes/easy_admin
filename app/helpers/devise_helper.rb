module DeviseHelper
  def devise_error_messages!
    user = User.find_by(email: resource.email)
    return 'Email no encontrado' unless user.present?
  end
end

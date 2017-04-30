module DeviseHelper
  def devise_error_messages!
    return 'User not found' unless resource.id.present?
    'KABOOM!'
  end
end

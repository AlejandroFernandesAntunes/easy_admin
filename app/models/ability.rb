class Ability
  include CanCan::Ability

  def initialize(user)
    return if user.blank? || user.try(:role).blank?
    can :access, :rails_admin
    can :dashboard
    send("#{user.role}")
  end

  def admin
    can :manage, :all
  end

  def regular
    forbidden_models = [User, Service, Notification]
    readable_models = [Service, Notification]
    can :manage, all_models_except(forbidden_models)
    can :read, readable_models
  end

  def all_models_except(exceptions)
    RailsAdmin.config.included_models.map(&:constantize) - exceptions
  end
end

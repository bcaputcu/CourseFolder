class RegistrationsController < Devise::RegistrationsController
  after_filter :hook_tables

  protected

  def hook_tables
    if resource.persisted? # user is created successfuly
      resource.hook_tables
    end
 end
end
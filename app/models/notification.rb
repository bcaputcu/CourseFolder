class Notification < ActiveRecord::Base
  belongs_to :user

  default_scope where(:is_seen => false)
end

class Notification < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :user_id, :link, :is_seen, :content

  default_scope where(:is_seen => false)
end

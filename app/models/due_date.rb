class DueDate < ActiveRecord::Base
  belongs_to :section
  belongs_to :task
end

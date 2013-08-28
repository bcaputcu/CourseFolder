class Note < ActiveRecord::Base
  belongs_to :course
  belongs_to :author
  belongs_to :forked_from
end

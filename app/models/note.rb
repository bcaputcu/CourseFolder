class Note < ActiveRecord::Base
  belongs_to :course
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :forked_from, class_name: 'Note'

  has_many :forks, class_name: 'Note', foreign_key: 'forked_from_id'

  validates_presence_of :author_id
  validates_presence_of :title

end

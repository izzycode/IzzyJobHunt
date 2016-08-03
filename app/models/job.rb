class Job < ActiveRecord::Base
  belongs_to :user
  belongs_to :company
  has_many :attempts
  # validates :position, presence: true

end

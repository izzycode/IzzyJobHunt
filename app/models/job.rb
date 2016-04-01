class Job < ActiveRecord::Base
  belongs_to :user
  belongs_to :company
  has_many :companies
  has_many :attempts








end

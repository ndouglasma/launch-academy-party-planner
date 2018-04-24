class Party < ActiveRecord::Base
  has_many :invitations
  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true
end

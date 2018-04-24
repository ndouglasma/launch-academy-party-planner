class Invitation < ActiveRecord::Base
  belongs_to :party
  belongs_to :friend

  validates :rsvp, inclusion: { in: [true, false] }
  validates :rsvp, exclusion: { in: [nil] }
end

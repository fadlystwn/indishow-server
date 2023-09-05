class Album < ApplicationRecord
  belongs_to :artist
  validates :title, presence: true, length: { maximum: 225 }
  validates :release_date, presence: true
end

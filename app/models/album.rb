class Album < ApplicationRecord
  validates :title, presence: true, length: { maximum: 100 }
  validates :release_date, presence: true
  belongs_to :artist
end

class Artist < ApplicationRecord
    validates :name, presence: true, length: { maximum: 100 }
    validates :genre, presence: true, length: { maximum: 50 }
    validates :bio, presence: true, length: { maximum: 1000 }
    has_many :albums
    has_one_attached :profile_picture
end

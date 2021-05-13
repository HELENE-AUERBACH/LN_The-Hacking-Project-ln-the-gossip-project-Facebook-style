class Comment < ApplicationRecord
  validates :content,
            presence: true
  validates_associated :gossip
  validates_associated :author
  belongs_to :gossip
  belongs_to :author, class_name: "User"
end

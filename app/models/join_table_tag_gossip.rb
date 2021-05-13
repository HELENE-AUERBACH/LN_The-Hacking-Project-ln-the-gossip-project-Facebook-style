class JoinTableTagGossip < ApplicationRecord
  validates_associated :gossip
  validates_associated :tag
  belongs_to :gossip
  belongs_to :tag
end

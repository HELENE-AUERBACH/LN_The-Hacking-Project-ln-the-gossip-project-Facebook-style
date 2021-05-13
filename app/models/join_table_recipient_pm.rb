class JoinTableRecipientPm < ApplicationRecord
  validates_associated :private_message
  validates_associated :recipient
  belongs_to :private_message
  belongs_to :recipient, class_name: "User"
end

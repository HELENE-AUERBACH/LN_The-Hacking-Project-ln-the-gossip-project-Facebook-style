class User < ApplicationRecord
  validates :first_name,
            presence: true
  validates :last_name,
            presence: true
  validates :description,
            length: { minimum: 140 },
            presence: true
  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Recheck your email adress please!" }
  validates :age,
            numericality: { only_integer: true, greater_than: 13 },
            presence: true
  validates :password,
            presence: true,
            length: { minimum: 6 }
  validates_associated :city
  belongs_to :city
  has_many :gossips, foreign_key: 'author_id', class_name: "Gossip", dependent: :destroy
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage", dependent: :destroy
  has_many :join_table_recipient_pms, foreign_key: :recipient_id, class_name: "JoinTableRecipientPm", dependent: :destroy
  has_many :received_messages, through: :join_table_recipient_pms
  has_many :comments, foreign_key: 'author_id', class_name: "Comment", dependent: :destroy
  has_secure_password
end

class Subscription < ApplicationRecord
  validates_presence_of :title, :price, :status, :frequency
  enum frequency: ["Seasonal", "General", "Unique"]
  # enum status: ["Active", "Inactive"]
  # need to change schema for subscription.status from. string to enum 

  has_many :customer_subscriptions
  has_many :customers, through: :customer_subscriptions

  has_many :subscription_teas
  has_many :teas, through: :subscription_teas


end

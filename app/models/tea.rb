class Tea < ApplicationRecord
  validates_presence_of :title, :description, :temperature, :brew_time, :status
  enum status: ["Active", "Inactive"]

   has_many :subscription_teas
   has_many :subscriptions, through: :subscription_teas
   has_many :customer_subscriptions, through: :subscriptions
   has_many :customers, through: :customer_subscriptions
end

class Customer < ApplicationRecord
  validates_presence_of :first_name, :last_name,
                        :email, :address, :city,
                        :state, :zip_code

  has_many :customer_subscriptions
  has_many :subscriptions, through: :customer_subscriptions
end

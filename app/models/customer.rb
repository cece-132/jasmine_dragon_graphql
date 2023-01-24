class Customer < ApplicationRecord
  validates_presence_of :first_name, :last_name,
                        :email, :address, :city,
                        :state, :zip_code

end

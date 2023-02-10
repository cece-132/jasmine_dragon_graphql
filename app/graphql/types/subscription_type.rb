# frozen_string_literal: true

module Types
  class SubscriptionType < Types::BaseObject
    field :id, ID, null: false
    field :title, String
    field :price, Integer
    field :status, String
    field :frequency, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end

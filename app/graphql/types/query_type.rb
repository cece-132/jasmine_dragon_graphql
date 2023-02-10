module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :teas, [Types::TeaType], null: false,
      description: "return a list of teas"

    # field :subscriptions, [Types::SubscriptionType], null: false,
    # description: "return a list of subscriptions"

    def teas
      Tea.all
    end
  end
end

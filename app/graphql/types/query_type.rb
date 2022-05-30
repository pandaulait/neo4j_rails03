module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

    field :prefecture, Types::PrefectureType, null: true do
      description "Find prefecture by ID" #省略可
      argument :id, ID, required: true
    end

    def prefecture(id:)
      Prefecture.find(id)
    end

    def prefectures(page: nil, items: nil)
      Prefecture.all
    end
  end
end

# frozen_string_literal: true

module Types
  class BookType < Types::BaseObject
    field :id, ID, null: false
    field :title, String
    field :publish_year, String
    field :genre, String
    field :author_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end

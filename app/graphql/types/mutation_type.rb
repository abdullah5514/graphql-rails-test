module Types
  class MutationType < Types::BaseObject
    field :destroy_book, mutation: Mutations::DestroyBook
    field :create_book, mutation: Mutations::CreateBook
    field :destroy_author, mutation: Mutations::DestroyAuthor
    field :create_author, mutation: Mutations::CreateAuthor
    # TODO: remove me
    # field :test_field, String, null: false,
    #   description: "An example field added by the generator"
    # def test_field
    #   "Hello World"
    # end
  end
end

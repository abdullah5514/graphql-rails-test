module Mutations
  class DestroyBook < BaseMutation
    field :id, ID, null: true

    argument :id, ID, required: true

    def resolve(id:)
      book = Book.find(id)
      book.destroy
      {
          id: id,
      }
    end
  end
end

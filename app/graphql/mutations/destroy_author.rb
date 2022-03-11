module Mutations
  class DestroyAuthor < BaseMutation
    field :id, ID, null: true

    argument :id, ID, required: true

    def resolve(id:)
      author = Author.find(id)
      author.destroy
      {
          id: id,
      }
    end
  end
end

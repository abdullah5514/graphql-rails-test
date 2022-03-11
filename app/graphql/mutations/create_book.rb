module Mutations
  class CreateBook < BaseMutation
    argument :title, String, required: true
    argument :genre, String, required: true
    argument :publish_year, String, required: true
    argument :author_id, ID, required: true

    field :book, Types::BookType, null: false
    field :errors, [String], null: false

    def resolve(title:, genre:, publish_year:, author_id:)
      book = Book.new(title: title, genre: genre, publish_year: publish_year, author_id: author_id)

      if book.save
        { book: book, errors: [] }
      else
        { book: nil, errors: book.errors.full_messages }
      end
    end
  end
end

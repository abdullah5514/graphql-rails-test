class Mutations::CreateAuthor < Mutations::BaseMutation
  argument :first_name, String, required: true
  argument :sur_name, String, required: true
  argument :birth_year, String, required: true

  field :author, Types::AuthorType, null: false
  field :errors, [String], null: false

  def resolve(first_name:, sur_name:, birth_year:)
    author = Author.new(first_name: first_name, sur_name: sur_name, birth_year: birth_year)

    if author.save
      { author: author, errors: [] }
    else
      { author: nil, errors: author.errors.full_messages }
    end
  end
end
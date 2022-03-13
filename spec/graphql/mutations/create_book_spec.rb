require 'rails_helper'

module Mutations
  RSpec.describe CreateBook, type: :request do
    describe '.resolve' do
      it 'creates a book' do
        author = create(:author)

        expect do
          post '/graphql', params: { query: query(author_id: author.id) }
        end.to change { Book.count }.by(1)
      end

      it 'returns a book' do
        author = create(:author)

        post '/graphql', params: { query: query(author_id: author.id) }
        json = JSON.parse(response.body)
        data = json['data']['createBook']

        expect(data['book']).to include(
                            'id'              => '1',
                            'title'           => 'Spider man',
                            'publishYear' => '2018',
                            'genre'           => 'Action',
                            'authorId'          => author.id
                        )
      end
    end

    def query(author_id:)
      <<~GQL
        mutation {
            createBook(input: {
              title: "Spider man",
              genre: "Action",
              publishYear: "2018",
              authorId: #{author_id}
            }) {
              book {
                id
                title
                genre
                publishYear
                authorId
              }
              errors
            }
          }
      GQL
    end
  end
end
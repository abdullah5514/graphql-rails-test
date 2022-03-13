require 'rails_helper'

module Mutations
  RSpec.describe DestroyAuthor, type: :request do
    describe 'resolve' do
      it 'removes an author' do
        author = create(:author)

        expect do
          post '/graphql', params: { query: query(id: author.id) }
        end.to change { Author.count }.by(-1)
      end

      it 'returns an author id' do
        author = create(:author, first_name: 'Will', sur_name: 'Smith', birth_year: 1984)

        post '/graphql', params: { query: query(id: author.id) }
        json = JSON.parse(response.body)
        data = json['data']['destroyAuthor']

        expect(data).to include(
                          'id' => be_present
                        )
      end
    end

    def query(id:)
      <<~GQL
        mutation {
          destroyAuthor(input: {id: 1}) {
            id
          }
        }
      GQL
    end
  end
end
require 'rails_helper'

module Mutations
  RSpec.describe CreateAuthor, type: :request do
    describe '.resolve' do
      it 'creates an author' do
        expect do
          post '/graphql', params: { query: query }
        end.to change { Author.count }.by(1)
      end

      it 'returns an author' do
        post '/graphql', params: { query: query }
        json = JSON.parse(response.body)
        data = json['data']['createAuthor']

        expect(data['author']).to include(
                                    'id'            => '1',
                                    'firstName'     => 'Will',
                                    'surName'       => 'Smith',
                                    'birthYear'     => '1980'
                                )
      end
    end

    def query
      <<~GQL
        mutation {
          createAuthor(input: {
            firstName: "Will",
            surName: "Smith",
            birthYear: "1980"
          }) {
            author {
              id
              firstName
              surName
              birthYear
            }
            errors
          }
        }
      GQL
    end
  end
end
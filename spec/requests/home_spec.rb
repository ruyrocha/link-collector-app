# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Homes', type: :request do
  include Devise::Test::IntegrationHelpers

  describe 'GET /' do
    it 'returns HTTP success with a signed in user' do
      user = create(:user)

      sign_in user
      get '/'

      expect(response).to have_http_status(:success)
    end

    it 'returns HTTP redirect without a user session' do
      get '/'

      expect(response).to have_http_status(:redirect)
    end
  end
end

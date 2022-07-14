require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:example) { get('/users') }
    it 'http response must be sucess' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders index template' do
      expect(response).to render_template('index')
    end
    it 'renders correct page content' do
      expect(response.body).to include('Show List of users')
    end
  end

  describe 'GET /show' do
    before(:example) { get('/users/10') }
    it 'http response should be sucess' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders index template' do
      expect(response).to render_template('show')
    end
    it 'renders correct page content' do
      expect(response.body).to include('details of user')
    end
  end
end

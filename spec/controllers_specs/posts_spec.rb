require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:example) { get('/users/10/posts') }

    it 'http response should be sucess' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders correct page contents' do
      expect(response.body).to include('Post made by users')
    end

    it 'renders index template' do
      expect(response).to render_template('index')
    end
  end

  describe 'GET /show' do
    before(:example) { get('/users/111/posts/152') }
    it 'http response should be sucess' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders correct page contents' do
      expect(response.body).to include('details of Post made by users')
    end

    it 'renders index template' do
      expect(response).to render_template('show')
    end
  end
end

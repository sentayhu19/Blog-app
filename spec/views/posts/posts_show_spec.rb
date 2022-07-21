require 'rails_helper'
RSpec.feature 'User Show', type: :feature do
  before(:each) do
    @first_user = User.create(name: 'Sam', email: 'Sam@gmail.com', password: 'sam12', posts_counter: 0)
  end

  it 'display the all posts path for first user' do
    expect(page).to have_current_path("/users/#{@first_user.id}/posts/#{@post_one.id}")
  end
end

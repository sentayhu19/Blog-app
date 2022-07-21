require 'rails_helper'

RSpec.describe 'posts/index.html.erb', type: :feature do
  before(:each) do
    visit new_user_session_path
    @user = User.new(name: 'Sam', bio: 'Full stack developer', email: 'sam@gmail.com', password: 'sam22021',
                     photo: 'https://eitrawmaterials.eu/wp-content/uploads/2016/09/person-icon.png',
                     posts_counter: 1, confirmed_at: Time.now)
    @user.save
    5.times do
      Post.create(title: 'First post', text: 'Post content', author_id: @user.id, comments_counter: 0, likes_counter: 0)
    end
    fill_in 'user[email]', with: 'sam@gmail.com'
    fill_in 'user[password]', with: 'sam'
    visit(user_posts_path(@user.id))
  end

  it "Shows user's name" do
    expect(page).to have_content @user.name
  end

  it "shows user's profile picture" do
    all('img').each do |i|
      expect(i[:src]).to eq(@user.photo)
    end
  end

  it "shows see a post's title" do
    expect(page).to have_content('Sam')
  end

  it "shows some of the post's body" do
    expect(page).to have_content Post.first.text
  end

  it 'shows the first comment on a post' do
    Comment.create(text: 'first comment', author_id: @user.id, post_id: Post.first.id)
    visit(user_posts_path(@user.id))
    expect(page).to have_content Comment.first.text
  end

  it 'I should see how many likes a post has' do
    expect(page).to have_content 'Likes: 0'
  end
end

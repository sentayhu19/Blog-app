require 'rails_helper'

RSpec.describe 'User Show Page', type: :feature do
  before :each do
    @user1 = User.create!(name: 'Oybek', bio: 'This is my bio', posts_counter: 0, photo: 'https://eitrawmaterials.eu/wp-content/uploads/2016/09/person-icon.png',
                          email: 'Jack@gmail.com', password: 'password', confirmed_at: Time.now)
    @post1 = Post.create!(title: 'Post 1', text: 'This is my first post', author_id: @user1.id, comments_counter: 0,
                          likes_counter: 0)
    @post2 = Post.create!(title: 'post 2', text: 'This is my second post', author_id: @user1.id, comments_counter: 0,
                          likes_counter: 0)
    @post3 = Post.create!(title: 'Post 3', text: 'This is my third post', author_id: @user1.id, comments_counter: 0,
                          likes_counter: 0)
    @post4 = Post.create!(title: 'Post 4', text: 'This is my last post', author_id: @user1.id, comments_counter: 0,
                          likes_counter: 0)
  end

  it 'can see the the profile image for a user' do
    visit user_path(@user1)
    expect(page).to have_css("img[alt='rss feed']")
  end

  it "can see the user's username" do
    visit user_path(@user1)
    expect(page).to have_content 'Oybek'
  end

  it 'can see the number of posts for the user' do
    visit user_path(@user1)
    expect(page).to have_content('Number of posts: 4')
  end

  it "can see the user's bio" do
    visit user_path(@user1)
    expect(page).to have_content('This is my bio')
  end

  it "can see the user's first three posts" do
    visit user_path(@user1)
    expect(@user1.most_recent_three_posts.length).to eq(3)
  end

  it "can see a link that lets me view all of a user's posts." do
    visit user_path(@user1)
    expect(page).to have_link('Oybek')
  end

  it "click on Oybek to redirect to user's post's index page" do
    visit user_path(@user1)
    click_link 'Oybek'
    expect(current_path).to eq "/users/#{@user1.id}"
  end
end

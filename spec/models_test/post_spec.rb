require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    user1 = User.new(name: 'Sentayhu',
                     photo: 'https://as2.ftcdn.net/v2/jpg/02/17/51/67/1000_F
                     _217516770_nHjCK3C82B2ZUC3JB3qQs8W2BGLHxZfa.jpg', bio: 'I love AI', posts_counter: 0)
    Post.create!(title: 'Faster than a speeding bullet, more powerful than a locomotive…
      The Man of Steel fights a never-ending battle for truth, justice, and the American way.
      From his blue uniform to his flowing red cape', text: 'This post is to talk
      about AI', likes_counter: 0, comments_counter: 0,
                 user: user1)
  end

  describe 'Post Model validations' do
    it 'check for invalid if title column is empty' do
      subject.title = nil
      expect(subject).to_not be_valid
    end
    it 'check for valid post' do
      expect(subject).to be_valid
    end
    it 'check for invalid if likes_counters is empty' do
      subject.likes_counter = nil
      expect(subject).to_not be_valid
    end

    it 'check for invalid if comments_counter is empty' do
      subject.comments_counter = nil
      expect(subject).to_not be_valid
    end

    it 'check for invalid if text is more than 250 characters' do
      subject.title = 'r' * 260
      expect(subject).to_not be_valid
    end
  end
end

require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { Comment.new(text: 'I like superman') }
  before { subject.save }

  it 'No post raise error' do
    expect { subject.comment_counter }.to raise_error(NoMethodError)
  end
end

require 'rails_helper'

RSpec.describe Like, type: :model do
  subject { Like.new }
  before { subject.save }

  it 'No post rasie error' do
    expect { subject.likes_counter }.to raise_error(NoMethodError)
  end
end

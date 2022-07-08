require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Superman') }

  before { subject.save }

  it 'if name exist' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'check for post count to be  >= 0' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end
end

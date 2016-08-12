require 'rails_helper'

RSpec.describe Admin, type: :model do

  subject { build(:admin) }

  describe "validations" do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
  end

  it "has valida fatory" do
    expect(subject).to be_valid
  end
end

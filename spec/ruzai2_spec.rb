require 'spec_helper'

class TestList < ActiveRecord::Base
  include Ruzai2
end

describe Ruzai2 do
  it 'has a version number' do
    expect(Ruzai2::VERSION).not_to be nil
  end

  describe Ruzai2::RuzaiList do
    describe ".ban" do
      subject { Ruzai2::RuzaiList.ban!(user_id, hoge_id, fuga_id) }

      let(:user_id) { 1 }
      let(:hoge_id) { 2 }
      let(:fuga_id) { 3 }

      it "creates RuzaiList record." do
        expect(subject).to change { Ruzai2::RuzaiList.count }
      end
    end
  end
end

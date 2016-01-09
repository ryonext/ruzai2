require 'spec_helper'

describe Ruzai2 do
  it 'has a version number' do
    expect(Ruzai2::VERSION).not_to be nil
  end

  describe Ruzai2::RuzaiList do
    describe ".ban" do
      subject { Ruzai2::RuzaiList.ban!(id_params) }

      let(:id_params) {
        {
          test_id1: 1,
          test_id2: 2,
          test_id3: 3,
        }
      }

      it "creates RuzaiList record." do
        expect { subject }.to change { Ruzai2::RuzaiList.count }.by 1
      end
    end
  end
end

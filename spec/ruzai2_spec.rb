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

  describe ".banned?" do
    subject { Ruzai2::RuzaiList.banned?(id_params) }

    let(:id_params) {
      {
        test_id1: 1,
        test_id2: 2,
        test_id3: 3,
      }
    }

    context "banned" do
      before do
        Ruzai2::RuzaiList.ban!(id_params)
      end

      it "returns true" do
        expect(subject).to be true
      end
    end

    context "not banned" do
      it "returns false" do
        expect(subject).to be false
      end
    end

    context "expired" do
      before do
        Ruzai2::RuzaiList.ban!(id_params)
      end

      it "returns false" do
        Timecop.freeze(Date.today + 8) do
          expect(subject).to be false
        end
      end
    end

    context "only 1 id in 3 ids is banned." do
      let(:banned_id_params) {
        {
          test_id2: 2
        }
      }
      before do
        Ruzai2::RuzaiList.ban!(banned_id_params)
      end

      it "returns true" do
        expect(subject).to be true
      end
    end

    context "3 id is banned and search by 1 id." do
      let(:id_params) {
        {
          test_id2: 2
        }
      }
      let(:banned_id_params) {
        {
          test_id1: 1,
          test_id2: 2,
          test_id3: 3,
        }
      }
      before do
        Ruzai2::RuzaiList.ban!(banned_id_params)
      end

      it "returns true" do
        expect(subject).to be true
      end
    end
  end
end

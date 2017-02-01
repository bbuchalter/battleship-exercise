require "spec_helper"

RSpec.describe Ship do
  describe "#coords" do
    context "when vertical ship of length 3 is placed at [0,3]" do
      subject { described_class.new(0, 3, 3, Ship::VERTICAL).coords }
      it { is_expected.to eq [[0,3],[0,2],[0,1]] }
    end
    context "when horizontal ship of length 3 is placed at [0,3]" do
      subject { described_class.new(0, 3, 3, Ship::HORIZONTAL).coords }
      it { is_expected.to eq [[0,3],[1,3],[2,3]] }
    end
  end
end

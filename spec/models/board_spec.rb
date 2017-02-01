require "spec_helper"

RSpec.describe Board do
  describe "initial state" do
    subject { described_class.new.positions }

    it "has 10x10 positions" do
      expect(subject.count).to eq 100
    end

    it "no ships" do
      expect(subject.all? { |p| p.ship == nil }).to eq true
    end

    it "has no shots" do
      expect(subject.all? { |p| p.shot_upon == false }).to eq true
    end

    it "has no hits" do
      expect(subject.all? { |p| p.hit == false }).to eq true
    end
  end

  describe "#record_ship" do
    let(:expected_ship_positions) { [[0,3],[0,2],[0,1]] }
    let(:ship) { Ship.new(0, 3) }
    let(:board) { described_class.new }
    subject { board.record_ship(ship) }

    it "assigns the ships to the correct positions" do
      expect { subject }.to change {
        expected_ship_positions.map { |position| board.at(position).ship }
      }.from([nil, nil, nil]).to([ship, ship, ship])
    end
  end

  describe "#valid?" do
    subject { described_class.new.valid?(coord) }

    context "when [0,0]" do
      let(:coord) { [0,0] }
      it { is_expected.to eq true }
    end

    context "when [9,9]" do
      let(:coord) { [9,9] }
      it { is_expected.to eq true }
    end

    context "when [-1,0]" do
      let(:coord) { [-1,0] }
      it { is_expected.to eq false }
    end

    context "when [0,-1]" do
      let(:coord) { [0,-1] }
      it { is_expected.to eq false }
    end

    context "when [10,0]" do
      let(:coord) { [10,0] }
      it { is_expected.to eq false }
    end

    context "when [0,10]" do
      let(:coord) { [0,10] }
      it { is_expected.to eq false }
    end
  end

  describe "#at" do
    subject { described_class.new.at(coord) }

    context "with a valid coordinate" do
      let(:coord) { [0,1] }
      it "returns a position with a matching coordinate" do
        expect(subject).to be_a Position
        expect(subject.x).to eq 0
        expect(subject.y).to eq 1
      end
    end

    context "with an invalid coordinate" do
      let(:coord) { [11,-1] }
      it "raises an exception" do
        expect { subject }.to raise_error Board::InvalidCoordinate
      end
    end
  end
end

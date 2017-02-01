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
end

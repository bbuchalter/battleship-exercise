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
end
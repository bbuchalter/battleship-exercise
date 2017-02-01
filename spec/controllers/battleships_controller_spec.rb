require 'rails_helper'

RSpec.describe BattleshipsController do
  describe "POST create.json" do
    let(:positions) do
      [
        [0, 3],
        [4, 8],
        [6, 6]
      ]
    end
    it "returns 'OK'" do
      post :create, params: { positions: positions.to_json }, format: :json
      expect(response.body).to eq "OK"
      expect(response.status).to eq 200
    end
  end

  describe "PUT update.json" do
    it "returns an empty string" do
      put :update, params: { x: "0", y: "0" }, format: :json
      expect(response.body).to eq ""
      expect(response.status).to eq 200
    end

    context "a ship is placed" do
      context "and the shot misses" do
        it "returns 'miss'", :pending do
          expect(response.body).to eq "miss"
        end
      end

      context "and the shot hits" do
        it "returns 'hit'", :pending do
          expect(response.body).to eq "hit"
        end
      end

      context "and is one hit away from sunk" do
        context "and the next shot is a hit" do
          it "returns 'sunk'", :pending do
            expect(response.body).to eq "sunk"
          end
        end
      end
    end
  end
end

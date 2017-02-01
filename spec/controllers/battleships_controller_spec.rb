require 'rails_helper'

RSpec.describe BattleshipsController do
  describe "POST create.json" do
    context "when positions are valid" do
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

    context "when positions are invalid" do
      let(:positions) do
        [
          [11, 11]
        ]
      end
      it "returns 422", :pending do
        post :create, params: { positions: positions.to_json }, format: :json
        expect(response.status).to eq 422
      end
    end
  end

  describe "PUT update.json" do
    it "returns an empty string" do
      put :update, params: { x: "0", y: "0" }, format: :json
      expect(response.body).to eq ""
      expect(response.status).to eq 200
    end

    context "a ship is placed" do
      let(:positions) do
        [
          [0, 3]
        ]
      end

      before do
        # Ships will be placed at `[[0,3],[0,2],[0,1]]`
        post :create, params: { positions: positions.to_json }, format: :json
      end

      context "and the shot misses" do
        let(:shot) { { x: "1", y: "1" } }

        it "returns 'miss'", :pending do
          put :update, params: shot, format: :json
          expect(response.body).to eq "miss"
        end
      end

      context "and the shot hits" do
        let(:shot) { { x: "0", y: "1" } }

        it "returns 'hit'", :pending do
          put :update, params: shot, format: :json
          expect(response.body).to eq "hit"
        end
      end

      context "and is one hit away from sunk" do
        before do
          put :update, params: { x: "0", y: "3" }, format: :json
          put :update, params: { x: "0", y: "2" }, format: :json
        end
        context "and the next shot is a hit" do
          let(:shot) { { x: "0", y: "1" } }

          it "returns 'sunk'", :pending do
            put :update, params: shot, format: :json
            expect(response.body).to eq "sunk"
          end
        end
      end
    end

    context "when shot is invalid" do
      let(:shot) { { x: "11", y: "11" } }

      it "returns 422", :pending do
        put :update, params: shot, format: :json
        expect(response.status).to eq 422
      end
    end
  end
end

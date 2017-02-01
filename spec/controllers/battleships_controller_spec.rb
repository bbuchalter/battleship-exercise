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
  end
end

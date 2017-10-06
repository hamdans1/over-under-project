require 'rails_helper'

RSpec.describe Team, type: :model do
    let(:players) {"K Porzingis"}
    let(:total){31.0}
    let(:over){nil}
    let(:league){'NBA'}
    let(:coach){'J Hornacek'}
    let(:name){'Knicks'}
    let(:team){Team.create!(players: players, total: total, over: over, league: league, name: name, coach: coach)}
    
    it {is_expected.to validate_presence_of(:players)}
    it {is_expected.to validate_presence_of(:total)}
    it {is_expected.to validate_presence_of(:league)}
    it {is_expected.to validate_presence_of(:coach)}
    it {is_expected.to validate_presence_of(:name)}
    
    describe "attributes" do
        it "has players, total, league, name, and coach attributes" do
            expect(team).to have_attributes(players: players, total: total, league: league, name: name, coach: coach)
        end
    end
    
    
end
require 'rails_helper'

RSpec.describe LocationModelConcerns::Configuration do
  describe "#settings" do
    it "returns a Settings object" do
      expect(LocationModelConcerns.configuration.settings).to be_kind_of(Config::Options)
    end
  end

end

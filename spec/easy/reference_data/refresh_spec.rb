require 'spec_helper'
require 'easy/reference_data/refresh'

RSpec.describe Easy::ReferenceData do

  describe ".refresh" do

    context "with a unique attribue" do
      context "and no exisitng record" do

        it "creates a new record" do
          expect{
            Easy::ReferenceData.refresh User, :system_code, 1, name: "Jane", email: "jane@example.com"
          }.to change{ User.count }
        end

      end

      context "and an exisitng record" do
        it "updates the existing record" do
          user = User.create(system_code: 1, name: "Jo")

          expect{ Easy::ReferenceData.refresh User, :system_code, 1, name: "Jane", email: "jane@example.com" }.to change{ user.reload.name }.to "Jane"
        end

        it "does not create duplicate records" do
          user = User.create(system_code: 1, name: "Jo")

          expect{ Easy::ReferenceData.refresh User, :system_code, 1, name: "Jo", email: "jane@example.com" }.not_to change{ User.count }
        end
      end
    end

  end
end

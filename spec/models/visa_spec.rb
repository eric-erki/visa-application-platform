# coding: utf-8
require "spec_helper"
require "rails_helper"

describe Visa do
  subject(:visa) { Visa.new(country_abbr: 'JPN', visa_type: 0, note: 'This should be handled as soon as possible', statuses: [status_0, status_1]) }
  let(:status_0) { Status.new(note: "未处理", status_code: 0) }
  let(:status_1) { Status.new(note: "材料审核中，请耐心等待", status_code: 1)}

  context "with invalid input" do

  end

  context "with valid input" do
    
    it "should have these available countries" do
      countries = Visa.available_countries
      expect(countries).to include('JPN', 'USA', 'DEU', 'FRA')
    end

    it "should have corresponding visa type and status" do
      expect(visa.visa_type_name).to eq 'Study'
    end

    it "should have correct current status" do
      visa.statuses.stub_chain(:order, :last).with("status_code asc").with(no_args)
      visa.current_status
      expect(visa.current_status).to eq status_1
    end
    
    it "should have correct status history" do
      expect(visa.statuses).to eq [status_0, status_1]
    end
  end
end

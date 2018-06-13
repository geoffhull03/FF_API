require 'spec_helper'
require 'api_constraints'

describe APIConstraints do
  let (:api_constraints_v1) { APIConstraints.new(version: 1) }
  let (:api_constraints_v2) { APIConstraints.new(version: 2, default: true) }

  describe "matches?" do
    it "returns true when the version matches the 'Accept' header" do
      request = double(host: 'api.ffapi.dev', headers: {"Accept" => "application/vnd.ffapi.v1"})
      expect(api_constraints_v1.matches?(request)).to be true
    end

    it "returns the default version when 'default' option is specified" do
      request = double(host: 'api.ffapi.dev')
      expect(api_constraints_v2.matches?(request)).to be true
    end
  end
end

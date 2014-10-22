require 'rails_helper'
require "webmock/rspec"

WebMock.disable_net_connect!(:allow_localhost => true)
INSTAGRAM_API_URL = /.*api\.instagram\.com.*/

RSpec.describe HomeController, :type => :controller do

  describe "GET index" do

    before do
      FactoryGirl.create(:country_name)
      body = [{
        :images => {
          :low_resolution => { :url => 'http://example.jpg' }
        },
        :caption => { :text => "hogehoge" }
      }]

      stub_request(:get, INSTAGRAM_API_URL).to_return({
        :body => {:data => body },
        :status => 200
      })
    end

    it "returns http success" do
      xhr :get, :index
      expect(response).to have_http_status(:success)
    end
  end
end


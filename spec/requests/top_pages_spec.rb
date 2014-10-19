require 'rails_helper'
require "webmock/rspec"

WebMock.allow_net_connect!

RSpec.describe "TopPages", :type => :request do

  subject { page }

  describe "GET /top_pages" do
    it "works! (now write some real specs)" do
      visit root_path
      should have_title('Worldgram')
    end
  end
end

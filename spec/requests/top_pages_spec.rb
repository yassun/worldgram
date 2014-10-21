require 'rails_helper'
require "webmock/rspec"

WebMock.disable_net_connect!(:allow_localhost => true)
INSTAGRAM_API_URL = /.*api\.instagram\.com.*/

RSpec.describe 'ユーザーが写真一覧を閲覧する', :type => :request do

  context 'トップページに遷移したとき' do

    context 'かつ InstagramAPIからデータが取得できたとき' do

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
        visit root_path
      end

      it '写真の一覧が表示されている事' do
        expect(page).to have_title('Worldgram')
        expect(page).to have_selector("img[src$='http://example.jpg']")
        expect(page).to have_selector('div.caption', text: 'hogehoge')
        expect(page).to have_content("Japan")
        expect(page).to have_link('wiki', :href => 'http://ja.wikipedia.org/wiki/日本')
      end
    end

  end

end

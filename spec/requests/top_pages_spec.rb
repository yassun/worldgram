require 'rails_helper'
require "webmock/rspec"

WebMock.allow_net_connect!

EXAMPLE_SITE_URL = "https://api.instagram.com/v1/tags/Iceland/media/recent.json"

RSpec.describe 'ユーザーが写真一覧を閲覧する', :type => :request do

  context 'トップページに遷移したとき' do

    context 'かつ InstagramAPIからデータが取得できたとき' do
      before do
        body = [{
          :images => {
            :low_resolution => { :url => 'http://example.jpg' }
          },
          :caption => { :text => "hogehoge" }
        }]

        stub_request(:get, EXAMPLE_SITE_URL).to_return({
          :body => {:data => body },
          :status => 200
        })

        visit root_path
      end

      it '写真の一覧が表示されている事' do
        expect(page).to have_title('Worldgram')
        expect(page).to have_selector("img[src$='http://example.jpg']")
        expect(page).to have_selector('div.caption', text: 'hogehoge')
      end

    end
  end

end

#! /usr/bin/env ruby

require 'json'
require 'net/https'

ACCESS_TOKEN = ENV['POCKET_ACCESS_TOKEN']
CONSUMER_KEY = ENV['POCKET_CONSUMER_KEY']

headers = {
  'Content-Type' => 'application/json;charset=UTF-8',
  'X-Accept' => 'application/json'
}

params = {
  consumer_key: CONSUMER_KEY,
  access_token: ACCESS_TOKEN,
  sort: 'newest',
  detailType: 'simple'
}

data = params.map { |k, v| [k, v.to_s.encode('utf-8')] }.to_h

http = Net::HTTP.new('getpocket.com', 443)
http.use_ssl = true

req = Net::HTTP::Post.new('/v3/get', initheader = headers)
req.set_form_data data

res = http.request req

raise 'error: cannot get response.' unless res.is_a?(Net::HTTPOK)

res_json = JSON.parse(res.body)

actions = res_json['list'].keys.map { |item_id| {action: 'archive', item_id: item_id.to_i} }

params = {
  actions: actions.to_json,
  consumer_key: CONSUMER_KEY,
  access_token: ACCESS_TOKEN
}

req = Net::HTTP::Post.new('/v3/send', initheader = headers)
req.set_form_data params

res = http.request req

raise 'error: cannot get response.' unless res.is_a?(Net::HTTPOK)

puts 'done'


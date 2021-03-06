require 'net/http'
require 'uri'
require 'json'

uri = URI.parse("http://10.84.23.35:8880/v2/apps")
request = Net::HTTP::Post.new uri.path
request.content_type = "application/json"
request["Cache-Control"] = "no-cache"

request.body = JSON.dump({
  "id" => "mango-1",
  "cmd" => "ping 1.1.1.1",
  "cpus" => 0.3,
  "mem" => 256,
  "disk" => 0,
  "instances" => 1,
  "container" => {
    "type" => "MESOS",
    "volumes" => [],
    "docker" => {
      "image" => "alpine",
      "forcePullImage" => true
    }
  },
  "ipAddress" => {
    "networkName" => "contrail-cni-plugin",
    "labels" => {
      "networks" => "blue-network",
      "network-subnets" => "5.5.5.0/24",
      "project-name" => "default-project",
      "domain-name" => "default-domain"
    }
  }
})

response = Net::HTTP.start(uri.hostname, uri.port) do |http|
  http.request(request)
end
puts response

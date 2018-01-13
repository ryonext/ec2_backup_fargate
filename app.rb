#! /usr/bin/env ruby
require "aws-sdk"
require "logger"

logger = Logger.new(STDOUT)
logger.level = Logger::INFO

NO_REBOOT = true

client = Aws::EC2::Client.new(region: "ap-northeast-1")
res = client.describe_instances
instance_ids = res.reservations.map { |r| r.instances.first.instance_id }

image_label = Time.now.utc.strftime("%Y%m%d%H%M%S")

instance_ids.each do |i|
  client.create_image(
    instance_id: i,
    name: "#{image_label}_#{i}",
    no_reboot: NO_REBOOT
  )
end

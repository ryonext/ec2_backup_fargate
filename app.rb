#! /usr/bin/env ruby
require "aws-sdk"
require "logger"

logger = Logger.new(STDOUT)
logger.level = Logger::INFO

client = Aws::EC2::Client.new(region: "ap-northeast-1")
res = client.describe_instances
instance_ids = res.reservations.map { |r| r.instances.first.instance_id }

p instance_ids

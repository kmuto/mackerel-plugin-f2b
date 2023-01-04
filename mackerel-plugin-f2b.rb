#!/usr/bin/env ruby
# Copyright 2023 Kenshi Muto
require 'time'
require 'json'
IO.popen('fail2ban-client banned') do |f|
  array = JSON.parse(f.read.gsub("'", '"'))
  now = Time.now.to_i
  array.each do |a|
    a.keys.each do |k|
      puts "f2b.#{k}\t#{a[k].size}\t#{now}"
    end
  end
end

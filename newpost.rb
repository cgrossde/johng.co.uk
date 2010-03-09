#!/usr/bin/env ruby

# require Dir

unless ARGV[0]
  puts 'Usage: newpost "the post title"'
  exit(-1)
end

blog_root = "/Users/John/Documents/ruby/johng.co.uk"
date_prefix = Time.now.strftime("%Y-%m-%d")
postname = ARGV[0].strip.downcase.gsub(/ /, '-')
post = "#{blog_root}/_posts/#{date_prefix}-#{postname}.md"

header = <<-END
---
layout: post
title: "#{ARGV[0]}"
---
END

Dir.chdir(blog_root)

File.open(post, 'w') do |f|
  f << header
end

system("mate", "-w", post)
system("git", "add", post)
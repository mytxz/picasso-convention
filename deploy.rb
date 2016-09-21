require 'rubygems'
require 'pathname'
require 'fileutils'

def make_folder!(path)
  path.mkpath
end

def copy_keep!(path)
  FileUtils.touch path.join('.keep')
end

def make_host!(root, domain_name)
  make_folder! root.join(domain_name)

  [ 'ssl-certs', 'vhosts' ].each do |folder|
    make_folder! root.join(domain_name, folder)
    copy_keep!   root.join(domain_name, folder)
  end

end

if ARGV.length<1
  puts 'Usage:'
  puts 'ruby deploy.rb <DEPLOY_REPOSITORY>'
  puts 'The <DEPLOY_REPOSITORY> looks like /var/repositories/Vdin/picasso-deploy/'
  exit
end

puts '---- ---- 1. Checking'
root_path = Pathname.new ARGV[0]
unless root_path.exist?
  puts "The root folder #{ARGV[0]} does not exist."
  exit
end

matched = /(.+)-deploy/.match root_path.basename.to_s
if matched.nil?
  puts "Failed to extract the product code from the repository name '#{root_path.basename}'. It looks like 'product-deploy'."
  exit
end
code = matched[1]

puts '---- ---- 2. Making Hosts'
[ 'alpha', 'beta', 'staging', 'live' ].each do |stage|
  make_host! root_path, "#{code}-#{stage}.vdin01.com"
end

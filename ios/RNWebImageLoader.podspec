
require "json"

package = JSON.parse(File.read(File.join(__dir__, "..", "package.json")))
version = package['version']

Pod::Spec.new do |s|
  s.name         = "RNWebImageLoader"
  s.version      = version
  s.summary      = package["description"]
  s.description  = <<-DESC
                   Use SDWebImage inside the react-native Image pipeline!
                   DESC
  s.homepage     = "https://github.com/ericlewis/RNWebImageLoader"
  s.license      = "MIT"
  s.license      = package["license"]
  s.author       = { "author" => "ericlewis777@gmail.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/ericlewis/RNWebImageLoader.git", :tag => "master" }
  s.source_files = "*.{h,m}"
  s.requires_arc = true


  s.dependency "React"
  s.dependency "SDWebImage", '~> 5.0'

end

  
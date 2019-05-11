
require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))
version = package['version']
repository = package["repository"]

Pod::Spec.new do |s|
  s.name         = "RNImageLoader"
  s.version      = version
  s.summary      = package["description"]
  s.description  = <<-DESC
                   Use SDWebImage inside the react-native Image pipeline!
                   DESC
  s.homepage     = repository
  s.license      = "MIT"
  s.license      = package["license"]
  s.author       = { "author" => "ericlewis777@gmail.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "#{repository}.git", :tag => "master" }
  s.source_files = "ios/*.{h,m}"
  s.requires_arc = true


  s.dependency "React"
  s.dependency "SDWebImage", '~> 5.0'

end

  
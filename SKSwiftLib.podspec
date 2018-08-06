#
# Be sure to run `pod lib lint SKSwiftLib.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SKSwiftLib'
  s.version          = '1.0.0'
  s.summary          = 'A bunch of classes I commonly use'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/skorulis/SKSwiftLib'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'skorulis' => 'skorulis@gmail.com' }
  s.source           = { :git => 'https://github.com/skorulis/SKSwiftLib.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platforms = { :ios => "10.0", :osx => "10.12" }

  s.source_files = 'SKSwiftLib/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SKSwiftLib' => ['SKSwiftLib/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'PromiseKit'
end

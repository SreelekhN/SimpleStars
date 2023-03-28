Pod::Spec.new do |s|
  s.name             = 'SimpleStars'
  s.version          = '1.0.0'
  s.summary          = 'A simple way to add star ratings in your ios app. simple, short and with all customization you generally need'
  s.description  = "A simple way to add star ratings in your ios app. simple, short and with all customization you generally need. Register the delegate to unlock customization, which are declared optional"
  s.homepage         = 'https://github.com/SreelekhN/SimpleStars'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'SreelekhN' => 'sreelekhn@gmail.com' }
  # s.platform         = :ios, "16.1"
  s.source           = { :git => "https://github.com/SreelekhN/SimpleStars.git", :branch => "master",
                     :tag => s.version.to_s }
  
  s.ios.deployment_target = '11.0'
  
  s.source_files = 'Source/**/*'
  s.swift_versions = '5.0'
  s.ios.deployment_target = '16.1'
  
  # s.exclude_files = ''
  # s.resources = ''
  # s.resource_bundles = {
  #   'SimpleStars' => ['SimpleStars/Assets/*.png']
  # }
  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end

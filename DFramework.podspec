Pod::Spec.new do |s|
  s.name             = 'DFramework'
  s.version          = '0.3.0'
  s.summary          = 'A base framework is for iOS, macOS, watchOS and tvOS development.'

  s.description      = <<-DESC
  D-Framework focuses the base of a development. Managers, utilities, extensions, views.
                       DESC

  s.homepage         = 'https://github.com/demirciy/D-Framework'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Yusuf Demirci' => 'demirciy.software@gmail.com' }
  s.source           = { :git => 'https://github.com/demirciy/D-Framework.git', :tag => s.version.to_s }
  s.social_media_url = 'https://yusufdemirci.dev/open-source/d-framework'
  
  s.platform = :ios
  s.requires_arc = true
  s.swift_version = '5.0'
  s.ios.deployment_target = '14.0'
  s.vendored_frameworks = "xcframework/DFramework.xcframework"
  
end

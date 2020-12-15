
Pod::Spec.new do |s|
  s.name             = 'DFramework'
  s.version          = '0.2.0'
  s.summary          = 'A base framework is for iOS, macOS, watchOS and tvOS development.'

  s.description      = <<-DESC
  D-Framework focuses the base of a development. Managers, utilities, extensions, views.
                       DESC

  s.homepage         = 'https://github.com/demirciy/D-Framework'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Yusuf Demirci' => 'demirciy.software@gmail.com' }
  s.source           = { :git => 'https://github.com/demirciy/D-Framework.git', :tag => s.version.to_s }
  s.social_media_url = 'https://yusufdemirci.dev/open-source/d-framework'

  s.ios.deployment_target = '14.0'
  s.osx.deployment_target = '10.15.6'
  s.watchos.deployment_target = '7.0'
  s.tvos.deployment_target = '14.0'

  s.source_files = 'DFramework/Classes/**/*'

  s.swift_version = '5.0'

  s.requires_arc = true

  s.source_files = 'DFramework/Classes/**/*', 'DFramework/Resources/CodeGeneration/*'
  s.resources = 'DFramework/Resources/*'
  
end

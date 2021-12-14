
Pod::Spec.new do |s|
  s.name             = 'DFramework'
  s.version          = '0.3.0'
  s.summary          = 'A base framework for iOS development.'

  s.description      = <<-DESC
  D-Framework focuses the base of a development. Managers, utilities, extensions, views.
                       DESC

  s.homepage         = 'https://github.com/demirciy/D-Framework'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Yusuf Demirci' => 'demirciy.software@gmail.com' }
  s.source           = { :git => 'https://github.com/demirciy/D-Framework.git', :tag => s.version.to_s }
  s.social_media_url = 'https://yusufdemirci.dev/open-source/d-framework'

  s.ios.deployment_target = '14.0'

  # s.source_files = 'DFramework/Classes/**/*'

  s.swift_version = '5.0'

  s.requires_arc = true

  s.source_files = 'Sources/DFramework/**/*'

  # s.source_files = 'DFramework/Classes/**/*', 'DFramework/Resources/CodeGeneration/*'
  # s.resources = 'DFramework/Resources/*'

  # s.dependency 'SnapKit'
  
end

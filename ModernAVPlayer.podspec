Pod::Spec.new do |s|
  s.name             = 'ModernAVPlayer'
  s.version          = '1.2.0'
  s.summary          = 'ModernAVPlayer is an audio persistence AVPlayer wrapper'
  s.description      = <<-DESC
ModernAVPlayer is an ongoing project that aims to create a more usable audio video player with readable status and network persistence option.
                       DESC
  s.homepage         = 'https://github.com/raphrel/ModernAVPlayer'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'raphael ankierman' => 'raphrel@gmail.com' }
  s.source           = { :git => 'https://github.com/raphrel/ModernAVPlayer.git', :tag => s.version.to_s }
  s.default_subspec  = 'Core'

  s.ios.deployment_target = '10.0'
  s.swift_version = '5.0'

  s.subspec 'Core' do |core|
    core.source_files = 'Sources/Core/**/*'
  end

  s.subspec 'RxSwift' do |ss|
    ss.dependency 'ModernAVPlayer/Core'
    ss.dependency "RxSwift", "~> 4.5"
    ss.dependency "RxCocoa", "~> 4.5"
    ss.source_files = 'Sources/RxModernAVPlayer/**/*'
  end

end

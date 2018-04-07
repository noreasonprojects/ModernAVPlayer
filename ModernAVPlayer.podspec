Pod::Spec.new do |s|
  s.name             = 'ModernAVPlayer'
  s.version          = '0.9.0'
  s.summary          = 'ModernAVPlayer is an audio persistence AVPlayer wrapper'
  s.description      = <<-DESC
ModernAVPlayer is an ongoing project that aims to create a more usable audio video player with readable status and network persistence option.
                       DESC
  s.homepage         = 'https://github.com/raphrel/ModernAVPlayer'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'raphael ankierman' => 'raphrel@gmail.com' }
  s.source           = { :git => 'https://github.com/raphrel/ModernAVPlayer.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  s.swift_version = '4.0'
  s.source_files = 'Sources/**/*'
end

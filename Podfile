platform :ios, '10.0'
use_frameworks!

target 'ModernAVPlayer_Example' do
  pod 'ModernAVPlayer/Core', :path => '.'
  pod 'ModernAVPlayer/RxSwift', :path => '.'
  pod 'RxSwift', '~> 4.0', :inhibit_warnings => true
  pod 'RxCocoa', '~> 4.0'
  pod 'SwiftLint', '0.25.0'

  target 'ModernAVPlayer_Tests' do
    inherit! :search_paths

	pod 'Quick', '1.2.0'
	pod 'Nimble', '7.0.3'
  end
end

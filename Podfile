use_frameworks!
inhibit_all_warnings!

target 'ModernAVPlayer_Example' do
  platform :ios, '10.0'
  pod 'ModernAVPlayer/RxSwift', :path => '.'
  pod 'SwiftLint', '0.38.2'

  target 'ModernAVPlayer_Tests' do
    inherit! :search_paths

	pod 'Quick', '2.2.0'
	pod 'Nimble', '8.0.4'
	pod 'SwiftyMocky', '3.5.0'

  end
end

target 'ModernAVPlayer_Example_tvOS' do
  platform :tvos, '10.0'
  pod 'ModernAVPlayer/RxSwift', :path => '.'
end

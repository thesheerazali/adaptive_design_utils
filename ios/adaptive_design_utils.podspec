#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint adaptive_design_utils.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'adaptive_design_utils'
  s.version          = '0.0.1'
  s.summary          = 'A comprehensive Flutter plugin for adaptive and responsive design'
  s.description      = <<-DESC
A Flutter plugin that provides utilities and widgets for creating adaptive and responsive layouts across different screen sizes and platforms.
                       DESC
  s.homepage         = 'https://github.com/yourusername/adaptive_design_utils'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '11.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end

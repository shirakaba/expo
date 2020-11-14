#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'expo_nativescript_adapter'
  s.version          = '0.0.1'
  s.summary          = 'A new nativescript plugin project.'
  s.description      = <<-DESC
A new nativescript plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  # Although Flutter introduced this, I don't think we need it for NativeScript.
  # s.dependency 'NativeScript'
  
  s.ios.deployment_target = '8.0'
end


Pod::Spec.new do |s|
  s.name             = 'Einstein'
  s.version          = '0.2.0'
  s.summary          = 'Einstein integrates the project and UItest through AccessibilityIdentified, and It supports chain function to make test coding understand easier and more concise'
  s.description      = <<-DESC
This library have two parts,
the one supports assign AccessibilityIdentified to the UIElements easier and concise, 
another one gets the elements by AccessibilityIdentified to writing uitest code in chain function way.
here we define EasyPredicate to avoid writing hard code when we use NSPredicate. 
in this way, EasyPredicate is more like OOP which we are familiar to use it.
                       DESC

  s.ios.deployment_target = '9.0'
  s.homepage              = 'https://github.com/ZhipingYang/Einstein'
  s.license               = { :type => 'MIT', :file => 'LICENSE' }
  s.author                = { 'Daniel Yang' => 'xcodeyang@gmail.com' }
  s.platform              = :ios, '9.0' # todo: support MacOS
  s.requires_arc          = true
  s.swift_version         = '5.0'
  s.default_subspecs      = 'Identifier', 'UITest'
  s.source = {
    :git => 'https://github.com/ZhipingYang/Einstein.git',
    :tag => s.version.to_s
  }

  s.subspec 'Identifier' do |iden|
      iden.source_files   = 'class/identifier/*.swift'
      iden.ios.framework  = "UIKit"
  end

  s.subspec 'UITest' do |test|
      test.source_files         = 'class/uitest/**/*.swift'
      test.ios.framework        = "UIKit", "XCTest"
      test.pod_target_xcconfig  = { 'ENABLE_BITCODE' => 'NO' }
      test.dependency 'Einstein/Identifier'
      test.dependency 'Then'
  end

end

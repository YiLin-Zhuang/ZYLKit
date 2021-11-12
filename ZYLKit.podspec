Pod::Spec.new do |s|
  s.name             = 'ZYLKit'
  s.version          = '0.1.0'
  s.summary          = '一些好用的方法與封裝元件'
  s.homepage         = 'https://github.com/sdf0822/ZYLKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'yiLin' => 'sdf0822@gmail.com' }
  s.source           = { :git => 'https://github.com/sdf0822/ZYLKit.git', :tag => s.version }
  s.ios.deployment_target = '13.0'
  s.swift_version = '5.0'
  s.source_files = 'Sources/ZYLKit/**/*'
end
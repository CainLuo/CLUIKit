Pod::Spec.new do |s|

  s.name         = "CLUIKit"
  s.version      = "1.5.1"
  s.summary      = "123123123123123123123123123"
  s.homepage     = "https://github.com/CainLuo/CLUIKit"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "CainLuo" => "350116542@qq.com" }
  s.platform     = :ios, '8.0'
  s.source       = { :git => "https://github.com/CainLuo/CLUIKit.git", :tag => "v#{s.version}" }
  s.source_files = 'CLUIKit/*.{h,m}'
  s.requires_arc = true
  s.frameworks   = 'UIKit', 'Foundation'
  s.dependency "MJRefresh"
end
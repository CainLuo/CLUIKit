Pod::Spec.new do |spec|

  spec.name         = "CLUIKit"
  spec.version      = "1.6.2"
  spec.summary      = "CLUIKit for iOS"
  spec.homepage     = "https://github.com/CainLuo/CLUIKit"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "CainLuo" => "350116542@qq.com" }
  spec.platform     = :ios, '8.0'
  spec.source       = { :git => "https://github.com/CainLuo/CLUIKit.git", :tag => "#{spec.version}" }
  spec.source_files = "CLUIKit", "CLUIKit/**/*.{h,m}"
  spec.requires_arc = true
  spec.frameworks   = 'UIKit', 'Foundation'

  spec.dependency "MJRefresh"
  spec.dependency "CLFoundation"
  spec.dependency "Masonry"

end

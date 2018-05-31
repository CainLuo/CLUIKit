Pod::Spec.new do |spec|

  spec.name         = "CLUIKit"
  spec.version      = "2.2.0"
  spec.summary      = "CLUIKit for iOS"
  spec.homepage     = "https://github.com/CainLuo/CLUIKit"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "CainLuo" => "350116542@qq.com" }
  spec.platform     = :ios, '8.0'
  spec.source       = { :git => "https://github.com/CainLuo/CLUIKit.git", :tag => "#{spec.version}" }
  spec.source_files = "CLUIKit", "CLUIKit/**/*.{h,m}"
  spec.requires_arc = true
  spec.frameworks   = 'UIKit', 'Foundation'

  # spec.default_subspec = "AMap2DMap"

  spec.dependency "MJRefresh"
  spec.dependency "CLFoundation"
  spec.dependency "Masonry"

  # spec.subspec 'AMap2DMap' do |aMap2DMap|

  # aMap2DMap.source_files = "CLUIKit/CLAMap2D/**/*.{h,m}"

  # aMap2DMap.dependency "AMap2DMap"
  # end

  spec.subspec 'AMap3DMap' do |aMap3DMap|

    aMap3DMap.source_files = "CLUIKit/CLAMap3D/**/*.{h,m}"

    aMap3DMap.dependency "AMap3DMap"
  end

  spec.subspec 'GoogleMap' do |googleMap|

    googleMap.source_files = "CLUIKit/CLGoogleMap/**/*.{h,m}"

    googleMap.dependency "GoogleMaps"
  end

end

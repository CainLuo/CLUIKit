Pod::Spec.new do |s|

  s.name         = "CLUIKit"
  s.version      = "v1.5.1"
  s.summary      = "CLUIKit of iOS."

  s.description  = <<-DESC
                   CLUIKit of iOS
                   DESC

  s.homepage     = "https://github.com/CainLuo/CLUIKit"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author = { "CainLuo" => "350116542@qq.com" }

  s.source = { :git => "https://github.com/CainLuo/CLUIKit.git", :tag => "v#{s.version}" }

  s.source_files  = "CLUIKit", "CLUIKit/**/*.{h,m}"
  s.public_header_files = 'CLUIKit/*.{h}'

  s.requires_arc = true

  s.dependency "MJRefresh"

end
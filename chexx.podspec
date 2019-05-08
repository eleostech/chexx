Pod::Spec.new do |s|
  s.name         = "chexx"
  s.version      = "0.0.1"
  s.summary      = "Provides success and failure HUD displays."
  s.author       = { "Phillip Calvin" => "phillip.calvin@eleostech.com" }
  s.source       = { :git => "https://github.com/eleostech/chexx.git" }
  s.platform     = :ios, '11.0'
  s.source_files = 'chexx/*.{h,m}'
  s.homepage     = "http://eleostech.com"
  s.resources = "Resources/*.png"
  s.requires_arc = true
  s.dependency 'MBProgressHUD', '~> 0.8'
end

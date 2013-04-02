Pod::Spec.new do |s|
  s.name         = "chexx"
  s.version      = "0.0.1"
  s.summary      = "Provides success and failure HUD displays."
  s.author       = { "Phillip Calvin" => "phillip.calvin@eleostech.com" }
  s.source       = { :git => "https://github.com/eleostech/chexx.git" }
  s.platform     = :ios, '4.3'
  s.source_files = '*.{h,m}'
  s.public_header_files = 'chexx.h'
  s.resources = "Resources/*.png"
  s.requires_arc = true
  s.dependency 'MBProgressHUD', '0.5'
end
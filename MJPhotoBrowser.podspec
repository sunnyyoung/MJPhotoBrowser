Pod::Spec.new do |s|
  s.name         = "MJPhotoBrowser@Sunnyyoung"
  s.version      = "1.0.0"
  s.summary      = "The easiest lightest way to use PhotoBrowser"
  s.homepage     = "https://github.com/Sunnyyoung/MJPhotoBrowser"
  s.license      = "MIT"
  s.authors      = { 'azxfire' => 'https://github.com/azxfire' }
  s.platform     = :ios, "6.0"
  s.source       = { :git => "https://github.com/Sunnyyoung/MJPhotoBrowser.git", :tag => s.version }
  s.source_files = "MJPhotoBrowser/MJPhotoBrowser/*.{h,m}"
  s.resource     = "MJPhotoBrowser/MJPhotoBrowser/*.bundle"
  s.requires_arc = true
  s.dependency 'SDWebImage'
  s.dependency 'MBProgressHUD'
end
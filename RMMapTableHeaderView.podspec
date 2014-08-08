Pod::Spec.new do |s|
  s.name         = "RMMapTableHeaderView"
  s.version      = "0.0.1"
  s.summary      = "A short description of RMMapTableHeaderView."
  s.description  = ""
  s.homepage     = "git@github.com:runmad/RMMapTableHeaderView.git"
  s.license      = "MIT (example)"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "Rune Madsen" => "runemadsen@mac.com" }
  # Or just: s.author    = "Rune Madsen"
  # s.authors            = { "Rune Madsen" => "runemadsen@mac.com" }
  # s.social_media_url   = "http://twitter.com/Rune Madsen"
  s.platform     = :ios
  # s.platform     = :ios, "5.0"
  s.source       = { :git => "git@github.com:runmad/RMMapTableHeaderView.git", :tag => "0.0.1" }
  s.source_files  = "Classes", "Classes/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"
  s.framework  = "MapKit"
  # s.frameworks = "SomeFramework", "AnotherFramework"
  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"
  # s.requires_arc = true
  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"
end

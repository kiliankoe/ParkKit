Pod::Spec.new do |s|
  s.name        = "ParkKit"
  s.version     = "0.2.0"
  s.summary     = "ParkAPI wrapper for Swift apps"
  s.description = <<-DESC
    This is a wrapper for the API provided by [ParkAPI](https://github.com/offenesdresden/ParkAPI) for anything written in Swift.
    It's primary purpose is to be used by [ParkenDD](https://github.com/kiliankoe/ParkenDD).
  DESC

  s.homepage         = "https://github.com/kiliankoe/ParkKit"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "Kilian Koeltzsch" => "me@kilian.io" }
  s.social_media_url = "https://twitter.com/kiliankoe"

  s.ios.deployment_target     = "8.0"
  s.osx.deployment_target     = "10.10"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target    = "9.0"

  s.source       = { :git => "https://github.com/kiliankoe/ParkKit.git", :tag => s.version.to_s }
  s.source_files = "Sources/**/*"

  s.frameworks = "Foundation"

  s.dependency 'ModelMapper', '6.0.0'
end

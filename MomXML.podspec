Pod::Spec.new do |s|
  s.name             = "MomXML"
  s.version          = "0.0.1"
  s.license          = "MIT"
  s.homepage         = "https://github.com/phimage/MomXML/"
  s.summary          = "Create or parse CoreData XMLs model definition."
  s.author             = { "phimage" => "eric.marchand.n7@gmail.com" }

  s.source           = { :git => "https://github.com/phimage/MomXML.git", :tag => s.version }

  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.10'

  s.source_files        = "Sources/**/*.swift"

  s.dependency 'SWXMLHash'
end

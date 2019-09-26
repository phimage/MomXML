Pod::Spec.new do |s|
  s.name             = "MomXML"
  s.version          = "1.0.2"
  s.license          = "MIT"
  s.homepage         = "https://github.com/phimage/MomXML/"
  s.summary          = "Create or parse CoreData XMLs model definition."
  s.author             = { "phimage" => "eric.marchand.n7@gmail.com" }

  s.source           = { :git => "https://github.com/phimage/MomXML.git", :tag => s.version }

  s.ios.deployment_target = '10.0'
  s.osx.deployment_target = '10.10'

  s.default_subspecs = 'Model', 'Equatable', 'ToXML'

  s.subspec "Model" do  |sp|
    sp.source_files = "Sources/Model/*.swift"
  end

  s.subspec "Equatable" do  |sp|
    sp.source_files = "Sources/Equatable/*.swift"
    sp.dependency 'MomXML/Model'
  end

  s.subspec "FromXML" do  |sp|
    sp.source_files = "Sources/FromXML/*.swift"
    sp.dependency 'MomXML/Model'
    sp.dependency 'SWXMLHash'
  end

  s.subspec "ToXML" do  |sp|
    sp.dependency 'MomXML/Model'
    sp.source_files = "Sources/ToXML/*.swift"
  end

  s.subspec "XML" do  |sp|
    sp.dependency 'MomXML/FromXML'
    sp.dependency 'MomXML/ToXML'
  end

  s.subspec "FromCoreData" do  |sp|
    sp.source_files = "Sources/FromCoreData/*.swift"
    sp.dependency 'MomXML/Model'
    sp.frameworks = 'CoreData'
  end

  s.subspec "ToCoreData" do  |sp|
    sp.source_files = "Sources/ToCoreData/*.swift"
    sp.dependency 'MomXML/Model'
    sp.frameworks = 'CoreData'
  end

  s.subspec "CoreData" do  |sp|
    sp.dependency 'MomXML/FromCoreData'
    sp.dependency 'MomXML/ToCoreData'
  end

end

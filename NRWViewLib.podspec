Pod::Spec.new do |s|
    s.name         = "NRWViewLib"
    s.version      = "0.1.11"
    s.summary      = "Base View"
    s.description  = "Base View Lib"
    s.homepage     = "https://github.com/UknowHui/NRWViewLib"
    s.license      = { :type => 'MIT', :file => 'LICENSE' }
    s.author       = { "UknowHui" => "wangyahuiuknow@gmail.com" }
    s.platform     = :ios, '9.0'
    s.source       = { :git => "https://github.com/UknowHui/NRWViewLib.git", :tag => s.version.to_s }
    s.source_files = 'NRWViewLib/**/*.{h,m}'
    s.resources    = 'NRWViewLib/NRWViewLib.bundle'
    s.requires_arc = true
end

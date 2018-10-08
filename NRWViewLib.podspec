Pod::Spec.new do |s|
    s.name         = "NRWViewLib"
    s.version      = "0.1.3"
    s.summary      = "Base View"
    s.description  = "Base View Lib"
    s.homepage     = "https://github.com/UknowHui/NRWViewLib"
    s.license      = { :type => 'MIT', :file => 'LICENSE' }
    s.author       = { "UknowHui" => "wangyahuiuknow@gmail.com" }
    s.platform     = :ios, '9.0'
    s.source       = { :git => "https://github.com/UknowHui/NRWViewLib.git", :tag => s.version.to_s }
    s.source_files = 'NRWViewLib/NRWViewLib.h'
    s.public_header_files = 'NRWViewLib/NRWViewLib.h'
    s.resources    = 'NRWViewLib/NRWViewLib.bundle'
    s.requires_arc = true
    
    s.subspec 'NRWCategory' do |ss|
        ss.source_files = 'NRWViewLib/NRWCategory/*.{h,m}'
        ss.public_header_files = 'NRWViewLib/NRWCategory/*.h'
    end
    
    s.subspec 'NRWCustomView' do |ss|
        ss.source_files = 'NRWViewLib/NRWCustomView/*.{h,m}'
        ss.public_header_files = 'NRWViewLib/NRWCustomView/*.h'
        ss.dependency 'NRWViewLib/NRWUtil'
        ss.dependency 'NRWViewLib/NRWCategory'
    end
    
    s.subspec 'NRWUIKit' do |ss|
        ss.source_files = 'NRWViewLib/NRWUIKit/*.{h,m}'
        ss.public_header_files = 'NRWViewLib/NRWUIKit/*.h'
    end
    
    s.subspec 'NRWUtil' do |ss|
        ss.source_files = 'NRWViewLib/NRWUtil/*.{h,m}'
        ss.public_header_files = 'NRWViewLib/NRWUtil/*.h'
    end
end

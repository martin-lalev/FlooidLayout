Pod::Spec.new do |s|

s.name                  = "FlooidLayout"
s.version               = "1.0.8"
s.summary               = "Declarative Autolayout Library."
s.description           = "FloodLayout is an autolayout DSL, which helps you write a more intuitive and expressive code, by using custom operators and result builders."
s.homepage              = "http://github.com/martin-lalev/FlooidLayout"
s.license               = "MIT"
s.author                = "Martin Lalev"
s.platform              = :ios, "12.0"
s.source                = { :git => "https://github.com/martin-lalev/FlooidLayout.git", :tag => s.version }
s.source_files          = "FlooidLayout", "FlooidLayout/**/*.{swift}"
s.swift_version         = '5.1'
s.user_target_xcconfig  = { 'GENERATE_INFOPLIST_FILE' => 'YES' }

end

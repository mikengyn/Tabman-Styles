platform :ios, '9.0'

workspace 'Tabman-Styles'

use_frameworks!

def shared_pods

  pod 'Tabman', :git => 'https://github.com/uias/Tabman.git', :branch => 'develop'

end

target 'Twitter' do
  project './Twitter/Twitter.xcodeproj'
  workspace 'Tabman-Styles'

  shared_pods

end

target 'Instagram' do
  project './Instagram/Instagram.xcodeproj'
  workspace 'Tabman-Styles'

  shared_pods

end

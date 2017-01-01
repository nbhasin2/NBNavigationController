Pod::Spec.new do |s|
  s.name             = 'NBNavigationController'
  s.version          = '0.1.5'
  s.summary          = 'Navigation controller with custom transition'

  s.description      = <<-DESC
This NBNavigationController supports custom transition.
                       DESC

  s.homepage         = 'https://github.com/nbhasin2/NBNavigationController'
  s.license          = { :type => 'MIT', :file => 'LICENSE.txt' }
  s.author           = { 'Nishant Bhasin' => 'nikieme3@gmail.com' }
  s.source           = { :git => 'https://github.com/nbhasin2/NBNavigationController.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  s.source_files = 'NBNavigationController/*.swift'

end
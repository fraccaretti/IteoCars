# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

workspace 'Cars.xcworkspace'
project 'Cars.xcodeproj'
platform :ios, '10.0'
inhibit_all_warnings!
use_frameworks!

Cocoapod = Struct.new(:name, :version, :git, :branch)
Swinject = Cocoapod.new('Swinject', '~> 2.6')
SwinjectStoryboard = Cocoapod.new('SwinjectStoryboard', '2.2')
Alamofire = Cocoapod.new('Alamofire', '~> 4.8.2')
RealmSwift = Cocoapod.new('RealmSwift', '~> 3.0')

target 'Cars' do
  pod Swinject.name, Swinject.version
  pod SwinjectStoryboard.name, SwinjectStoryboard.version
  pod Alamofire.name, Alamofire.version
  pod RealmSwift.name, RealmSwift.version
end

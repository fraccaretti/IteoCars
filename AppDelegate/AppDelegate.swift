import UIKit
import Swinject
import SwinjectStoryboard

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let assembler: Assembler = Assembler([ModelAssembly(), UtilsAssembly(), IteoCarsServiceAssembly(), RealmAssembly(), AlamofireNetworkingAssembly(), ViewControllersAssembly()], container: SwinjectStoryboard.defaultContainer)
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        sendAllUnsentCars()
        return true
    }
}


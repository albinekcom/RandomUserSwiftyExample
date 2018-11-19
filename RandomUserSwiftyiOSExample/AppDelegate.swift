import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder {
    
    var window: UIWindow?
    
    let usersStorage = UsersStorage()
    
}

extension AppDelegate: UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        usersStorage.loadFromTheDeviceStorage()
        
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        usersStorage.saveToTheDeviceStorage()
    }
    
}

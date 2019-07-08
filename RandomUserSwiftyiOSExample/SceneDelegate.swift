import UIKit
import SwiftUI

@UIApplicationMain
final class SceneDelegate: UIResponder, UIApplicationDelegate {
    
    let usersStorage = UsersStorage()
    
    var window: UIWindow?
}
    
extension SceneDelegate: UIWindowSceneDelegate {
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        // Use a UIHostingController as window root view controller
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: ListView())
            self.window = window
            window.makeKeyAndVisible()
        }
        
        usersStorage.loadFromTheDeviceStorage()
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        usersStorage.saveToTheDeviceStorage()
    }
    
}

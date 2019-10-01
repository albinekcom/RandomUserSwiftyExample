import UIKit
import SwiftUI

@UIApplicationMain
final class SceneDelegate: UIResponder, UIApplicationDelegate {
    
    private let usersStorage: UsersStorage = UsersStorage()
    
    var window: UIWindow?
}
    
extension SceneDelegate: UIWindowSceneDelegate {
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
            
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UIHostingController(rootView: ListView(usersStorage: usersStorage))
        window.makeKeyAndVisible()
        
        self.window = window
        
        usersStorage.loadFromTheDeviceStorage()
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        usersStorage.saveToTheDeviceStorage()
    }
    
}

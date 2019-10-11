import UIKit
import SwiftUI

@UIApplicationMain
final class SceneDelegate: UIResponder, UIApplicationDelegate {
    
    private let userData: UserData = UserData()
    
    var window: UIWindow?
}
    
extension SceneDelegate: UIWindowSceneDelegate {
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
            
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UIHostingController(rootView: ListView().environmentObject(userData))
        window.makeKeyAndVisible()
        
        self.window = window
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.userData.loadFromTheDeviceStorage()
        }
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        userData.saveToTheDeviceStorage()
    }
    
}

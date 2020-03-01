//
//  SceneDelegate.swift
//  AppVenturada
//
//  Created by APPLE on 27/02/2020.
//  Copyright © 2020 Javier Roche. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        // MARK: Creacion de la jerarquia de vista
        // *********************************************************
        // UIWindow -> UITabBarController -> UIViewControllerA, B, C
        // *********************************************************
        // Al iniciarse la aplicacion, la ventana carga un controlador de vista en ella (rootViewController)
        
        //Intentamos coger la ventana
        guard let windowScene = (scene as? UIWindowScene) else { return }
        //Creamos vistas para todas las pantallas
        let sitioVC: SitioVC = SitioVC()
        let personaVC: PersonaVC = PersonaVC()
        let favoritoVC: FavoritoVC = FavoritoVC()
        let settingsVC: SettingsVC = SettingsVC()
        //Las vistas tienen propiedades y caracteristicas. Cuando se incluyan en un tabBar, caa una tendra su titulo, su image, ...
        sitioVC.tabBarItem = UITabBarItem.init(title: "Sitios", image: UIImage.init(systemName: "house.fill"), tag: 0)
        personaVC.tabBarItem = UITabBarItem.init(title: "Personas", image: UIImage.init(systemName: "person.3.fill"), tag: 1)
        favoritoVC.tabBarItem = UITabBarItem.init(title: "Favoritos", image: UIImage.init(systemName: "heart.fill"), tag: 1)
        settingsVC.tabBarItem = UITabBarItem.init(title: "Settings", image: UIImage.init(systemName: "gear"), tag: 2)
        
        //Creamos los NC para cada vista
        let navSitioVC = UINavigationController.init(rootViewController: sitioVC)
        let navPersonaVC = UINavigationController.init(rootViewController: personaVC)
        let navFavoritoVC = UINavigationController.init(rootViewController: favoritoVC)
        let navSettingsVC = UINavigationController.init(rootViewController: settingsVC)
        
        //Creamos el tabBar de la ventana, donde metemos los NC de cada vista
        let tabBC = UITabBarController()
        //Se le asignan los VC o las NV que los contengan
        //tabBarController.viewControllers = [sitioVC, personaVC, favoritoVC, settingsVC]
        tabBC.viewControllers = [navSitioVC, navPersonaVC, navFavoritoVC, navSettingsVC]
        //Le ponemos algo de diseño a la tabBar
        tabBC.tabBar.barStyle = .default
        tabBC.tabBar.isTranslucent = false
        tabBC.tabBar.tintColor = UIColor.init(red: 65/255.0, green: 169/255.0, blue: 76/255.0, alpha: 1.0)
        
        //Le pondemos algo de diseño a la barra de navegacion
        UINavigationBar.appearance().overrideUserInterfaceStyle = .light
        UINavigationBar.appearance().tintColor = UIColor.init(red: 65/255.0, green: 169/255.0, blue: 76/255.0, alpha: 1.0)
        
        //Instanciamos la ventana usando el inicializador frame (altura y anchura) que le damos mediante el CGRect de nuestra windowScene
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        //Cada ventana tiene que tener una escena
        window?.windowScene = windowScene
        //Asignamos el del tabBarViewController que hemos creado
        window?.rootViewController = tabBC
        //Le decimos a la ventana que se haga visible, si existe
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}


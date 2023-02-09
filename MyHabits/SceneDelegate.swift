//
//  SceneDelegate.swift
//  MyHabits
//
//  Created by Мария on 06.02.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func createHabitsViewController() -> UINavigationController {
        let habitsNavigationController = UINavigationController(rootViewController: HabitsViewController())
        habitsNavigationController.tabBarItem = UITabBarItem(title: "Привычки" , image: UIImage (systemName: "line.3.horizontal"), tag: 0)

        let appearanceHabits = UINavigationBarAppearance()
        appearanceHabits.configureWithDefaultBackground()
        habitsNavigationController.navigationBar.standardAppearance = appearanceHabits
        habitsNavigationController.navigationBar.scrollEdgeAppearance = appearanceHabits

        return habitsNavigationController
    }

    func createInfoViewController() -> UINavigationController {
        let infoViewController = UINavigationController(rootViewController: InfoViewController())
        infoViewController.tabBarItem = UITabBarItem(title: "Информация", image: UIImage(systemName: "info.circle.fill"), tag: 0)

        let appearanceInfo = UINavigationBarAppearance()
        appearanceInfo.configureWithDefaultBackground()
        infoViewController.navigationBar.standardAppearance = appearanceInfo
        infoViewController.navigationBar.scrollEdgeAppearance = appearanceInfo

        return infoViewController
    }

    func createTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithDefaultBackground()
        tabBarAppearance.backgroundColor = .white
        tabBarController.tabBar.standardAppearance = tabBarAppearance
        tabBarController.tabBar.scrollEdgeAppearance = tabBarAppearance

        //цвет выбранной кнопки вместо синего по умолчанию
        tabBarController.tabBar.tintColor = UIColor(red: 161/255.0, green: 22/255.0, blue: 204/255.0, alpha: 1.0)

        tabBarController.viewControllers = [createHabitsViewController(), createInfoViewController()]
        return tabBarController
    }

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let winScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: winScene)
        window.rootViewController = createTabBarController()
        window.makeKeyAndVisible()
        self.window = window
    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {

    }

    func sceneWillResignActive(_ scene: UIScene) {

    }

    func sceneWillEnterForeground(_ scene: UIScene) {

    }

    func sceneDidEnterBackground(_ scene: UIScene) {

    }


}


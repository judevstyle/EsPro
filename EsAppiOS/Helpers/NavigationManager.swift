//
//  NavigationManager.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 3/26/21.
//

import Foundation
import UIKit

extension UIViewController {
    
//    func openScene(identifier: SceneOpen) {
//        self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
//        self.navigationController?.navigationBar.topItem?.backBarButtonItem?.tintColor = UIColor.black
//
//        if let navFrame = self.navigationController?.navigationBar.frame {
//            if #available(iOS 13.0, *) {
//                let navBarAppearance = UINavigationBarAppearance()
//                navBarAppearance.configureWithOpaqueBackground()
//                navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
//                navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
//                let newframe = CGRect(origin: .zero, size: CGSize(width: navFrame.width, height: (navFrame.height + UIApplication.shared.statusBarFrame.height) ))
//                navBarAppearance.backgroundColor =  UIColor.gradientColor(startColor: .NavBarTop(), endColor: .NavBarBottom(), frame: newframe)
//                self.navigationController?.navigationBar.standardAppearance = navBarAppearance
//                self.navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
//            } else {
//                let newframe = CGRect(origin: .zero, size: CGSize(width: navFrame.width, height: (navFrame.height + UIApplication.shared.statusBarFrame.height) ))
//
//                self.navigationController?.navigationBar.barTintColor = UIColor.gradientColor(startColor: .NavBarTop(), endColor: .NavBarBottom(), frame: newframe)
//            }
//        }
//
//        self.performSegue(withIdentifier: identifier.rawValue, sender: nil)
//    }
    
}

import Foundation
import UIKit

public enum NavigationOpeningSender {
    case intro
    case login
    case productInfoList
    case customerInfoList
    case produceInfoDetail(prod: String)
    case customerInfoDetail
    case customerProfile

    public var storyboardName: String {
        switch self {
        case .intro:
            return "Intro"
        case .login:
            return "Login"
        case .productInfoList:
            return "ProductInfoList"
        case .customerInfoList:
            return "CustomerInfoList"
        case .produceInfoDetail:
            return "ProductInfo"
        case .customerInfoDetail:
            return "CustomerInfoDetail"
        case .customerProfile:
            return "CustomerProfile"
        }
    }
    
    public var classNameString: String {
        switch self {
        case .intro:
            return "IntroViewController"
        case .login:
            return "LoginViewController"
        case .productInfoList:
            return "ProductInfoListViewController"
        case .customerInfoList:
            return "CustomerInfoListViewController"
        case .produceInfoDetail:
            return "ProductInfoViewController"
        case .customerInfoDetail:
            return "CustomerInfoDetailViewController"
        case .customerProfile:
            return "CustomerProfileViewController"
        }
    }
    
    public var viewController: UIViewController {
        switch self {
        default:
            return UIViewController()
        }
    }
    
    public var titleNavigation: String {
        switch self {
        default:
            return ""
        }
    }
}

class NavigationManager {
    static let instance:NavigationManager = NavigationManager()
    
    var navigationController: UINavigationController!
    var currentPresentation: Presentation = .Root
    
    enum Presentation {
        case Root
        case Replace
        case Push
        case Modal(completion: (() -> Void)?, withNav: Bool?)
        case ModelNav(completion: (() -> Void)?)
        case ModalNoNav(completion: (() -> Void)?)
        case PopupSheet(completion: (() -> Void)?)
        case presentFullSceen(completion: (() -> Void)?)
        
    }
    
    init() {
        
    }
    
    
    func setupWithNavigationController(navigationController: UINavigationController?) {
        if let nav = navigationController {
            self.navigationController = nav
        }
    }
    
    func pushVC(to: NavigationOpeningSender, presentation: Presentation = .Push, isHiddenNavigationBar: Bool = false) {
        let loadingStoryBoard = to.storyboardName
        
        let storyboard = UIStoryboard(name: loadingStoryBoard, bundle: nil)
        var viewController: UIViewController = UIViewController()
        
        switch to {
        case .produceInfoDetail(let prod):
            if let className = storyboard.instantiateInitialViewController() as? ProductInfoViewController {
                className.viewModel.input.setProdId(prod: prod)
                viewController = className
            }
        default:
            viewController = storyboard.instantiateInitialViewController() ?? to.viewController
        }
        
        viewController.navigationItem.title = to.titleNavigation
        
        viewController.hideKeyboardWhenTappedAround()
        
        self.presentVC(viewController: viewController, presentation: presentation, isHiddenNavigationBar: isHiddenNavigationBar, to: to)
    }
    
    private func presentVC(viewController: UIViewController, presentation: Presentation, isHiddenNavigationBar: Bool = false, to: NavigationOpeningSender) {
        if let nav = self.navigationController {
            nav.isNavigationBarHidden = isHiddenNavigationBar
        }
        switch presentation {
        case .Push:
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            self.navigationController.pushViewController(viewController, animated: true)
        case .Root:
            self.navigationController.setViewControllers([viewController], animated: true)
        case .ModalNoNav(let completion):
            let nav: UINavigationController = getNavigationController(vc: viewController, isTranslucent: true)
            self.navigationController.present(nav, animated: true, completion: completion)
        case .Modal(let completion, let withNav):
            if withNav == true {
                let navBarOnModal: UINavigationController = UINavigationController(rootViewController: viewController)
//                navBarOnModal.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.PrimaryMedium(size: 18), NSAttributedString.Key.foregroundColor: UIColor.white]
//                navBarOnModal.navigationBar.barTintColor = UIColor.Primary
                navBarOnModal.navigationBar.setBackgroundImage(UIImage(), for: UIBarPosition.bottom, barMetrics: .default)
                navBarOnModal.navigationBar.shadowImage = UIImage()
                navBarOnModal.navigationBar.isTranslucent = false
                navBarOnModal.navigationBar.barStyle = .black
                navBarOnModal.navigationBar.tintColor = .white
                
                navBarOnModal.navigationItem.title = to.titleNavigation
                self.navigationController.present(navBarOnModal, animated: true, completion: completion)
            } else {
                self.navigationController.present(viewController, animated: true, completion: completion)
            }
        case .Replace:
            var viewControllers = Array(self.navigationController.viewControllers.dropLast())
            viewControllers.append(viewController)
            self.navigationController.setViewControllers(viewControllers, animated: true)
        case .ModelNav(let completion):
            viewController.modalPresentationStyle = .fullScreen
            self.navigationController.present(viewController, animated: true, completion: completion)
        case .PopupSheet(completion: let completion):
            viewController.view.backgroundColor = UIColor.blackAlpha(alpha: 0.2)
            viewController.modalPresentationStyle = .overFullScreen
            viewController.modalTransitionStyle = .crossDissolve
            self.navigationController.present(viewController, animated: true, completion: completion)
        case .presentFullSceen(let completion):
            
            let nav: UINavigationController = UINavigationController(rootViewController: viewController)
            nav.navigationBar.setBackgroundImage(UIImage(), for: .default)
            nav.navigationBar.shadowImage = UIImage()
            nav.navigationBar.isTranslucent = true
            
            nav.view.backgroundColor = UIColor.black
            nav.modalPresentationStyle = .overFullScreen
            nav.modalTransitionStyle = .crossDissolve
            
            self.navigationController.present(nav, animated: true, completion: completion)
        }
        self.currentPresentation = presentation
    }
    
    func setRootViewController(rootView: NavigationOpeningSender) {
        UIView.transition(
             with: UIApplication.shared.keyWindow!,
             duration: 0.25,
             options: .transitionFlipFromLeft,
             animations: {
                let loadingStoryBoard = rootView.storyboardName
                // Override point for customization after application launch.
                let storyboard = UIStoryboard(name: loadingStoryBoard, bundle: nil)
                let vc = storyboard.instantiateInitialViewController() ?? UIViewController()

//                let nav: UINavigationController = UINavigationController(rootViewController: vc)
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.window?.rootViewController = vc
                appDelegate.window?.makeKeyAndVisible()
         })
    }
    
    private func getNavigationController(vc: UIViewController, isTranslucent: Bool, isFullScreen: Bool = false) -> UINavigationController {
        let nav: UINavigationController = UINavigationController(rootViewController: vc)
        nav.navigationBar.setBackgroundImage(UIImage(), for: .default)
        nav.navigationBar.shadowImage = UIImage()
        nav.navigationBar.isTranslucent = isTranslucent == true ? true : false
//        nav.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.PrimaryMedium(size: 18), NSAttributedString.Key.foregroundColor: UIColor.white]
//        nav.navigationBar.barTintColor = UIColor.Primary
        
        if isFullScreen == true {
            nav.modalPresentationStyle = .overFullScreen
        }
        return nav
    }
    
}

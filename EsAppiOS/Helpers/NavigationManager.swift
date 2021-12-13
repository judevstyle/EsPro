//
//  NavigationManager.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 3/26/21.
//

import Foundation
import UIKit

extension UIViewController {
    
    func openScene(identifier: SceneOpen) {
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.topItem?.backBarButtonItem?.tintColor = UIColor.black
        
        if let navFrame = self.navigationController?.navigationBar.frame {
            if #available(iOS 13.0, *) {
                let navBarAppearance = UINavigationBarAppearance()
                navBarAppearance.configureWithOpaqueBackground()
                navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
                navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
                let newframe = CGRect(origin: .zero, size: CGSize(width: navFrame.width, height: (navFrame.height + UIApplication.shared.statusBarFrame.height) ))
                navBarAppearance.backgroundColor =  UIColor.gradientColor(startColor: .NavBarTop(), endColor: .NavBarBottom(), frame: newframe)
                self.navigationController?.navigationBar.standardAppearance = navBarAppearance
                self.navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
            } else {
                let newframe = CGRect(origin: .zero, size: CGSize(width: navFrame.width, height: (navFrame.height + UIApplication.shared.statusBarFrame.height) ))

                self.navigationController?.navigationBar.barTintColor = UIColor.gradientColor(startColor: .NavBarTop(), endColor: .NavBarBottom(), frame: newframe)
            }
        }
        
        self.performSegue(withIdentifier: identifier.rawValue, sender: nil)
    }
    
}

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
        self.performSegue(withIdentifier: identifier.rawValue, sender: nil)
    }
    
}

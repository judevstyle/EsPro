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
        self.performSegue(withIdentifier: identifier.rawValue, sender: nil)
    }
    
}

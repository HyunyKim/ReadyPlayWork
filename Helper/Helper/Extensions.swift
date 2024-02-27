//
//  Extensions.swift
//  Helper
//
//  Created by JeongHyun Kim on 2/2/24.
//

import Foundation
import UIKit

protocol Identifier {
    static var identifier: String { get }
}

extension Identifier {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UIView: Identifier {}


extension UIViewController {
    static func instantiate(storyboard: String = "Main") -> Self {
        let fullName = NSStringFromClass(self)
        let classname = fullName.components(separatedBy: ".").last ?? fullName
        let storyboard = UIStoryboard(name: storyboard, bundle: Bundle.main)
        if let viewController = storyboard.instantiateViewController(withIdentifier: classname) as? Self {
            return viewController
        }
        return Self()
    }
    static func xibInstantiate() -> Self {
        let fullName = NSStringFromClass(self)
        let classname = fullName.components(separatedBy: ".").last ?? fullName
        return Self.init(nibName: classname, bundle: Bundle.main)
    }
}

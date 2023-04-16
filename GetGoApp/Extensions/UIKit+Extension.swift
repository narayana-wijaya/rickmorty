//
//  UIKit+Extension.swift
//  GetGoApp
//
//  Created by Narayana Wijaya on 13/04/23.
//

import UIKit

extension UIViewController {
    func showAlert(_ title: String, messsage: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error", message: messsage, preferredStyle: .alert)
            let close = UIAlertAction(title: "Close", style: .cancel) { action in
                alert.dismiss(animated: true)
            }
            alert.addAction(close)
            self.present(alert, animated: true)
        }
    }
}

extension UIFont {
    public enum SFProRoundedType: String {
        case regular
        case semibold
        case medium
        case bold
    }
    
    static func SFProRounded(_ type: SFProRoundedType, size: CGFloat) -> UIFont {
        return UIFont(name: "SF Pro Rounded \(type.rawValue.capitalized)", size: size)!
    }
}

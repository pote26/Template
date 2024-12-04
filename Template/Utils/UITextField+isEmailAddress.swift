//
//  UITextField+isEmailAddress.swift
//  pathfinder
//
//  Created by pote26 on 06/11/2023.
//

import UIKit

extension UITextField {
    func isEmailAddress () -> Bool {
        let emailAddressRegEx = "[A-Z0-9a-z._+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailAddressTest = NSPredicate(format:"SELF MATCHES %@", emailAddressRegEx)
        let result = emailAddressTest.evaluate(with: self.text ?? "")
        return result
    }
}

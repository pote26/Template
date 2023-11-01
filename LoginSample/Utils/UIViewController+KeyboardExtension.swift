//
//  UIViewController+KeyboardExtension.swift
//  pathfinder
//
//  Created by pote26 on 29/09/2023.
//

import UIKit

extension UIViewController {
    
    //observe screen tap
    func myDismissKerboard() {
        let tapGR: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard)
        )
        tapGR.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGR)
    }
    
    //hide keyboard
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
}

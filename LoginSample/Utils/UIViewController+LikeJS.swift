//
//  LikeJS.swift
//  pathfinder
//
//  Created by pote26 on 23/Sep/2023
//

import UIKit

extension UIViewController {
    
    func alert(_ titleStr: String, msgStr: String = "", completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(
            title: titleStr,
            message: msgStr,
            preferredStyle: .alert
        )

        alertController.addAction(
            UIAlertAction(
                title: "OK",
                style: .default,
                handler: {_ in
                    if let completion = completion{
                        completion()
                    }
                }
            )
        )
        self.present(alertController, animated: true)
    }

    func confirm(_ titleStr: String,
                 msgStr: String = "",
                 falseMsg: String = "Cancel",
                 trueMsg: String = "OK",
                 completion: ((Bool) -> ())? = nil) {
        
            
        let confirmController = UIAlertController(
            title: titleStr,
            message: msgStr,
            preferredStyle: .alert
        )
        
        confirmController.addAction(
            UIAlertAction(
                title: falseMsg,
                style: .default,
                handler: {action in
                    completion?(false)
                }
            )
        )

        confirmController.addAction(
            UIAlertAction(
                title: trueMsg,
                style: .default,
                handler: {action in
                    completion?(true)
                }
            )
        )
        
        
        present(confirmController, animated: true)
    }
    
    func prompt(_ title: String,
                msg: String = "",
                prepairedText: String = "",
                placeHolder: String? = nil,
                keyboardType: UIKeyboardType = .default,
                isSecure: Bool = false,
                returnKeyType: UIReturnKeyType = .default,
                falseMsg: String = "Cancel",
                trueMsg: String = "OK",
                completion: ((String) -> ())? = nil ) {
        
        let promptController = UIAlertController(
            title: title,
            message: msg,
            preferredStyle: .alert
        )
        
        promptController.addTextField(
            configurationHandler: {textField in
                textField.text = prepairedText
                textField.placeholder = placeHolder
                textField.keyboardType = keyboardType
                textField.isSecureTextEntry = isSecure
                textField.returnKeyType = returnKeyType
                textField.enablesReturnKeyAutomatically = true
            }
        )
        
        promptController.addAction(
            UIAlertAction(
                title: falseMsg,
                style: .cancel
            )
        )
        
        let tf = promptController.textFields?.first
        if keyboardType == .emailAddress {
            promptController.addAction(
                UIAlertAction(
                    title: trueMsg,
                    style: .default,
                    handler: {_ in
                        if tf?.isEmailAddress() ?? false {
                            completion?(tf?.text ?? "")
                        } else {
                            self.alert(
                                "Email Address Required",
                                msgStr: "This form requires your email\naddress. Check you typed."
                            )
                        }
                    }
                )
            )
            
        } else {
            promptController.addAction(
                UIAlertAction(
                    title: trueMsg,
                    style: .default,
                    handler: {_ in
                        completion?(tf?.text ?? "")
                    }
                )
            )
        }
        
        present(promptController, animated: true)
    }
}

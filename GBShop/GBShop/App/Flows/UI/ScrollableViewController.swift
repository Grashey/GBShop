//
//  CustomViewController.swift
//  GBShop
//
//  Created by Aleksandr Fetisov on 11.08.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

import UIKit

protocol ViewControllerNeedsScrollView {
    var scrollView: UIScrollView? { get }
}

class ScrollableViewController: UIViewController, ViewControllerNeedsScrollView {
    
    var scrollView: UIScrollView?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapGR.numberOfTapsRequired = 1
        scrollView?.addGestureRecognizer(tapGR)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self)
        navigationController?.navigationBar.isHidden = false
    }
    
    @objc private func keyboardWasShown(notification: Notification){
        let info = notification.userInfo as NSDictionary?
        let keyboardSize = (info?.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height + 10, right: 0)
        scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    @objc private func keyboardWasHidden(notification: Notification){
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    @objc private func hideKeyboard(){
        scrollView?.endEditing(true)
    }
}

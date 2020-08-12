//
//  UserDetailController.swift
//  GBShop
//
//  Created by Aleksandr Fetisov on 10.08.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

import UIKit

class UserDetailController: ScrollableViewController {
    
    @IBOutlet var userDetailView: UserDetailView!
    let userSession = UserSession.instance
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView = userDetailView.scrollView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        let requestFactory = userSession.requestFactory
        let auth = requestFactory.makeAuthRequestFactory()
        let id = 123
        let userName = userDetailView.nameTextField.text ?? ""
        let password = userDetailView.passwordTextField.text ?? ""
        let email = userDetailView.emailTextField.text ?? ""
        let gender = userDetailView.genderTextField.text ?? ""
        let creditCard = userDetailView.creditCardTextField.text ?? ""
        let bio = userDetailView.bioTextField.text ?? ""
        auth.editUserInfo(id: id, userName: userName, password: password, email: email, gender: gender, creditCard: creditCard, bio: bio)  { response in
                    switch response.result {
                        case .success(let answer):
                            print("edit", answer)
                        case .failure(let error):
                            print(error.localizedDescription)
                    }
        }
        self.saveCompleted()
    }
    
    @IBAction func logOutButtonPressed(_ sender: Any) {
        let requestFactory = userSession.requestFactory
        let auth = requestFactory.makeAuthRequestFactory()
        let id = 123
        auth.logout(id: id) { response in
            switch response.result {
                case .success(let answer):
                    print("logout", answer)
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    func saveCompleted() {
        let alert = UIAlertController(title: "", message: "Saved!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    

}

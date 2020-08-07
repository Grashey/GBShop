//
//  UserRegistrationController.swift
//  GBShop
//
//  Created by Aleksandr Fetisov on 10.08.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

import UIKit

class UserRegistrationController: ScrollableViewController {
    
    @IBOutlet var userRegistrationView: UserRegistrationView!
    let userSession = UserSession.instance
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.scrollView = userRegistrationView.scrollView
    }
    
    @IBAction func registerButtonPressed(_ sender: Any) {
        let requestFactory = userSession.requestFactory
        let auth = requestFactory.makeAuthRequestFactory()
        var authMessage = ""
        if let name = userRegistrationView.loginTextField.text,
        let password = userRegistrationView.passwordTextField.text {
            let id = 123
            let email = "mail@mail.ru"
            let gender = "male"
            let creditCard = "1234567890"
            let bio = "Hello World!"
            auth.registerUser(id: id, userName: name, password: password, email: email, gender: gender, creditCard: creditCard, bio: bio) { response in
                switch response.result {
                    case .success(let answer):
                        print("registration ", answer)
                        if let message = answer.userMessage {
                            authMessage = message
                            print(authMessage)
                        }
                    case .failure(let error):
                        print(error.localizedDescription)
                }
            }
            //КОСТЫЛЬ! нужно вкрутить в замыкание выше, но через главный поток. Но как?
            sleep(1)
            registrationCompleted(message: authMessage)
        }
    }
    
    func registrationCompleted(message: String) {
        let alert = UIAlertController(title: "", message: "\(message)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            print(alert)
            self.navigationController?.popViewController(animated: true)
        }))
        self.present(alert, animated: true)
    }
}

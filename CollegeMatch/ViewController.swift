//
//  ViewController.swift
//  CollegeMatch
//
//  Created by Senuda Ratnayake on 4/3/22.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var titleLabel: UILabel! //titleLable
    @IBOutlet weak var usernameTextField: UITextField! //textField Username
    @IBOutlet weak var passwordTextField: UITextField! //textField Password
    @IBOutlet weak var recoverButton: UIButton! //buttonForgot credentials
    @IBOutlet weak var loginButton: UIButton! //login for current users
    @IBOutlet weak var signupButton: UIButton! // signup for new users
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let text = "CollegeMatchTM"
            if let titleFont = UIFont(name: "Noteworthy-Bold", size: 45.0), let subscriptFont = UIFont(name: "Noteworthy", size: 20.0) {
                let attString:NSMutableAttributedString = NSMutableAttributedString(string: text, attributes: [.font: titleFont])
                attString.setAttributes([.font: subscriptFont, .baselineOffset: 20], range: NSRange(location: text.count - 2, length: 2))
                self.titleLabel.attributedText = attString;
                
            }
        
        self.titleLabel.textColor = UIColor.systemBackground;
        self.view.backgroundColor = UIColor.systemGreen;
        
        
    }
    

}


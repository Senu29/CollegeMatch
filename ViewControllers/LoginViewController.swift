//
//  LoginViewController.swift
//  CollegeMatch
//
//  Created by Senuda Ratnayake on 4/9/22.
//

import UIKit
import Parse

class LoginViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var recoverButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var newUserLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        usernameTextField.tag = 0;
        passwordTextField.tag = 1;

        // Do any additional setup after loading the view.
        usernameLabel.text = "Username:"
        passwordLabel.text = "Password:"
        newUserLabel.text = "Create New Account"
        
        //changing up main title
        let text = "CollegeMatchTM"
            if let titleFont = UIFont(name: "Noteworthy-Bold", size: 45.0), let subscriptFont = UIFont(name: "Noteworthy", size: 18.0) {
                let attString:NSMutableAttributedString = NSMutableAttributedString(string: text, attributes: [.font: titleFont])
                attString.setAttributes([.font: subscriptFont, .baselineOffset: 20], range: NSRange(location: text.count - 2, length: 2))
                self.titleLabel.attributedText = attString;
                
                self.titleLabel.textColor = UIColor.systemBackground;
                self.view.backgroundColor = UIColor.systemGreen;
            }
        //button customized.
        loginButton.layer.borderWidth = 3
        loginButton.layer.cornerRadius = 12
        loginButton.layer.borderColor = UIColor.white.cgColor
        
        signUpButton.layer.borderWidth = 3
        signUpButton.layer.cornerRadius = 12
        signUpButton.layer.borderColor = UIColor.white.cgColor
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        usernameTextField.resignFirstResponder();
        passwordTextField.resignFirstResponder();
    }
    
    //moving between textFields.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        //usernameTextField.resignFirstResponder();
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1 ) as? UITextField{
            nextField.becomeFirstResponder();
        } else {
            textField.resignFirstResponder();
        }
        return false
    }
    @IBAction func onSignUpButton(_ sender: Any) {
        let user = PFUser()
        user.username = usernameTextField.text
        user.password = passwordTextField.text
        
        user.signUpInBackground { (success, error) in
            if success{
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else{
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
    
    @IBAction func onLoginButton(_ sender: Any) {
        
        let username = usernameTextField.text!
        let password = passwordTextField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if user != nil{
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else{
                print("Error: \(error?.localizedDescription)")
            }
        }
        
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

}

//
//  UserProfileViewController.swift
//  CollegeMatch
//
//  Created by Senuda Ratnayake on 4/10/22.
//

import UIKit
import Parse

class UserProfileViewController: UIViewController {
    @IBOutlet weak var userBarButton: UIBarButtonItem!
    @IBOutlet weak var logoutBarButton: UIBarButtonItem!
    
    let user = PFUser.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //changing the UserActive bar button item to the current logged in user.
        userBarButton.title = user?.username
        userBarButton.setTitleTextAttributes([
            NSAttributedString.Key.font: UIFont(name: "Noteworthy-Bold", size: 26.0)!,
            NSAttributedString.Key.foregroundColor: UIColor.systemBackground],
            for: .normal)
        
        //changing the logoutBarButton item apperence.
        logoutBarButton.tintColor = UIColor.systemBackground
    }
    
    @IBAction func onLogoutButton(_ sender: Any) {
        PFUser.logOut()
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        
        let loginViewController = main.instantiateViewController(withIdentifier: "LoginViewController")
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,let delegate = windowScene.delegate as? SceneDelegate else { return }
        
        delegate.window?.rootViewController = loginViewController
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

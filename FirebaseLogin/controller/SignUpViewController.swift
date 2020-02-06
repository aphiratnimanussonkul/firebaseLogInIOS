import UIKit
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var textFieldUserName: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        guard let username = textFieldUserName.text,
        username != "",
        let email = textFieldEmail.text,
        email != "",
        let password = textFieldPassword.text,
            password != "" else {
                AlertController.showAlert(inViewController: self, title: "Missing Info", message: "Please fill out all fields!")
                return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            
            guard error == nil else {
                AlertController.showAlert(inViewController: self, title: "Error", message: error!.localizedDescription)
                return
            }
            
            guard let user = authResult?.user else {
                return
            }

            let changeRequest = user.createProfileChangeRequest()
            changeRequest.displayName = username
            changeRequest.commitChanges { (error) in
                guard error == nil else {
                    AlertController.showAlert(inViewController: self, title: "Error", message: error!.localizedDescription)
                    return
                }
                
                self.performSegue(withIdentifier: "signUpSegue", sender: nil)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

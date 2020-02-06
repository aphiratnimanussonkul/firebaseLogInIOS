import UIKit
import Firebase

class SignInViewController: UIViewController {

    @IBOutlet weak var textFieldEmail: UITextField!
    
    @IBOutlet weak var textFieldPassword: UITextField!
    
    @IBAction func signInButtonTapped(_ sender: Any) {
        guard let email = textFieldEmail.text,
            email != "",
            let password = textFieldPassword.text,
            password != "" else {
                AlertController.showAlert(inViewController: self, title: "Missing Info", message: "Please fill out all required fields")
                return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { (signResult, error) in
            guard error == nil else {
                AlertController.showAlert(inViewController: self, title: "Error", message: error!.localizedDescription)
                return
            }
            
            guard let user = signResult?.user else {
                return
            }
            
            self.performSegue(withIdentifier: "signInSegue", sender: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

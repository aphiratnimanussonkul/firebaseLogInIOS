import UIKit
import Firebase

class SignOutViewController: UIViewController {

    @IBOutlet weak var labelName: UILabel!
    
    @IBAction func signOutButtonTapped(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let username = Auth.auth().currentUser?.displayName else {
            return
        }
        labelName.text = "Hello \(username)"
    }
    
}

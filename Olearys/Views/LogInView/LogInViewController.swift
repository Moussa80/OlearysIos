

import UIKit
import Firebase

//Real Olearys branch


class LogInViewController: UIViewController {
    
    @IBOutlet weak var passWrordTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var appNameLabel: UILabel!
    let buildRestaurant = BuildRestaurant()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
      // buildRestaurant.buildTables(tableQuantity: 40)
        
        
      
    }
    
    @IBAction func loginButton(_ sender: Any) {
        ControlInput.controlEmptyInput(userNameTextField: userNameTextField, passWrordTextField: passWrordTextField, viewController: self)
    }
    
  
    
    // Dismiss keyboard on touching screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        userNameTextField.text  = K.emptyText
        passWrordTextField.text = K.emptyText
    }
    
 
}

















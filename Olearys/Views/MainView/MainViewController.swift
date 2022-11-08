

import UIKit

class MainViewController: UIViewController {
    
    let backButton = UIBarButtonItem()
   
    @IBOutlet weak var deliciousNameBelowLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.title = K.LoggaUt
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
}

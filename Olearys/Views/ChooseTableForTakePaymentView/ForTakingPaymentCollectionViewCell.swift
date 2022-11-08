
import UIKit

// cell shows tables which have payment in FortakingPaymentViewController
class ForTakingPaymentCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var tableNumberLabel: UILabel!
    func setUpTalesContent(tableNumber : String){
        self.tableNumberLabel.text = tableNumber
   }
}

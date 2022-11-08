
import UIKit

// cell for tables in  in TableswithOrderViewController
class TableswithOrderCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var tableNumber: UILabel!
    func setUpTalesContent(tableNumber : String ,viewWidth : Float ){
        self.tableNumber.text = tableNumber
    }
}

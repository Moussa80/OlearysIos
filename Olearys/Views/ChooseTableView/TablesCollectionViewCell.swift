
import UIKit

// cell for tables in tablesViewController
class TablesCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var tableNumber: UILabel!

    func setUpTalesContent(tableNumber : String , color :UIColor){
        self.tableNumber.text = tableNumber 
        self.tableNumber.backgroundColor = color
    }
    
    
}

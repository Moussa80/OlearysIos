
import UIKit

class OrdersInKitchenCollectionViewCell:  UICollectionViewCell , UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var guestNumberLabel: UILabel!
    @IBOutlet weak var guestOrderTableView: UITableView!
    var types = [Type]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        guestOrderTableView.delegate = self
        guestOrderTableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return types.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.typeCell, for: indexPath) as! TypeTableViewCell
        
        cell.guestTypeLabel.text = types[indexPath.row].name
        if (types[indexPath.row].done == true){
            cell.guestTypeLabel.backgroundColor = Clr.tableAvailable
            
        }else{
            cell.guestTypeLabel.backgroundColor = Clr.tableBusy
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        types[indexPath.row].done = true
        guestOrderTableView.reloadData()
    }
    
}

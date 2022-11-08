
import UIKit

// cell for each menu in TakeOrderViewController
class MenuTableViewCell: UITableViewCell , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var typePricelabel: UILabel!
    @IBOutlet weak var menuCollectionView: UICollectionView!
    @IBOutlet weak var menuTittlelabel: UILabel!
    
    var takeOrderViewController = TakeOrderViewController()
    var menu = [Type]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.foodTypeCell, for: indexPath) as! FoodCollectionViewCell
        cell.foodNamelabel.text = "\(menu[indexPath.row].name) \(menu[indexPath.row].price)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        takeOrderViewController.showGuestOrder(type: menu[indexPath.row])
    }
    
    // cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (takeOrderViewController.view.frame.width > CGFloat(Nr.fiveHundred) &&
            takeOrderViewController.view.frame.height > CGFloat(Nr.fiveHundred)){
            return CGSize(width: Nr.twoHundred , height: Nr.oneHundred)
        }else{
            return CGSize(width: Nr.hundredThirty , height: Nr.sixtySeven)
        }
    }
}




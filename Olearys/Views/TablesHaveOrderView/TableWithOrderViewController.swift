
import UIKit


class TableWithOrderViewController: UIViewController , UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var TableWithOrderCollectionView: UICollectionView!
    let observeDataInfireBase = ObserveDataInfireBase()

    @IBOutlet weak var attGoraLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        observeDataInfireBase.getTablesWhichHaveOrder { [self] in
            TableWithOrderCollectionView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return observeDataInfireBase.tableshaveOrders.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.attGoraCell, for: indexPath) as! TableswithOrderCollectionViewCell
        let tableNumber = observeDataInfireBase.tableshaveOrders[indexPath.row].number
        cell.setUpTalesContent(tableNumber: tableNumber, viewWidth: Float(view.frame.width))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let table = observeDataInfireBase.tableshaveOrders[indexPath.row]
        performSegue(withIdentifier: K.toKitchenView, sender: table)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let kitchenView = segue.destination as! KitchenViewController
        kitchenView.table =   sender as! Table
    }
    
    // cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (view.frame.width > CGFloat(Nr.fiveHundred) && view.frame.height > CGFloat(Nr.fiveHundred)){
            return CGSize(width: Nr.twoHundred , height: Nr.oneHundred)
        }else{
            
            return CGSize(width: Nr.oneHundred , height: Nr.fifty)
        }
    }
}



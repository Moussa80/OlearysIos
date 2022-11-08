
import UIKit

class ForTakingPaymentViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    
    
    @IBOutlet weak var taBetaltLabel: UILabel!
    @IBOutlet weak var forTakingOrderCollectionView: UICollectionView!
    let observeDataInfireBase = ObserveDataInfireBase()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observeDataInfireBase.getTablesWhichHavePayment { [self] in
            forTakingOrderCollectionView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return observeDataInfireBase.tableshavePayment.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.fortakingPaymentCell , for: indexPath) as! ForTakingPaymentCollectionViewCell
        
        let tableNumber = observeDataInfireBase.tableshavePayment[indexPath.row].number
        cell.setUpTalesContent(tableNumber: tableNumber)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let table = observeDataInfireBase.tableshavePayment[indexPath.row]
        performSegue(withIdentifier: K.toPaymentView , sender: table)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let paymentView = segue.destination as! PaymentViewController
        paymentView.table =  sender as! Table
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






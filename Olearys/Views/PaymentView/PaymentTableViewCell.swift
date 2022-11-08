
import UIKit

class PaymentTableViewCell: UITableViewCell , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
 
    @IBOutlet weak var guestnumberlabel: UILabel!
    @IBOutlet weak var guestOrderCollectionView: UICollectionView!
    var viewWidth : Double = Nr.zeroPonitZero
    
    var order = [Type]()
  
   
    override func awakeFromNib() {
        super.awakeFromNib()
        guestOrderCollectionView.delegate = self
        guestOrderCollectionView.dataSource = self
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return order.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.typeCellInpaymentView , for: indexPath) as! PaymentCollectionViewCell
       cell.typeNameLabel.text = order[indexPath.row].name
        return cell
        }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
}
    
    // cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: viewWidth / CGFloat(Nr.threePointFive) , height: viewWidth / CGFloat(Nr.sixPointfive))
    }
    
    

}

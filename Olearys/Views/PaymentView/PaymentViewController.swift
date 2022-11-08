

import UIKit

class PaymentViewController: UIViewController  , UITableViewDelegate , UITableViewDataSource{
    
    
    
    @IBOutlet weak var tabelSumLabel: UILabel!
    @IBOutlet weak var guestordertableView: UITableView!
    
    var viewWidth : Float = Float(Nr.zeroPonitZero)
    let observeDataInFireBase = ObserveDataInfireBase()
    let removeDataInFireBase = RemovaDataInFireBase()
    var table = Table()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewWidth = Float (view.frame.width)
        tabelSumLabel.text = "\(K.bord) \(table.number)  \(K.summa)  \(table.sum)"
        observeDataInFireBase.getOneTableInformation(tableNumber: table.number) { [self] in
            guestordertableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return observeDataInFireBase.table.guests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.paymentCell, for: indexPath) as! PaymentTableViewCell
        
        let guestNumber = String(observeDataInFireBase.table.guests[indexPath.row].number)
        let guestSum = String(observeDataInFireBase.table.guests[indexPath.row].sum)
        
        cell.guestnumberlabel.text = "\(K.gast) \(guestNumber) :     \(guestSum)"
    
        cell.order = observeDataInFireBase.table.guests[indexPath.row].types
        cell.viewWidth = Double (view.frame.width)
        cell.guestOrderCollectionView.reloadData()
        return cell
    }
    
    @IBAction func payForWholeTableButton(_ sender: Any) {
        removeDataInFireBase.TablePaid(tableNumber: table.number)
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
}

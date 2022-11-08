
import UIKit

class TablesViewController: UIViewController  , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var chooseTablelabel: UILabel!
    @IBOutlet weak var tablesCollectionView: UICollectionView!
    let observeDataInfireBase = ObserveDataInfireBase()

    override func viewDidLoad() {
        super.viewDidLoad()
        tablesCollectionView.dataSource = self
        tablesCollectionView.delegate = self
        observeDataInfireBase.getTables { [self] in
            tablesCollectionView.reloadData()
        }}
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return observeDataInfireBase.tables.count
   }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.tablesCell , for: indexPath) as! TablesCollectionViewCell
        
        var color : UIColor?
        var tableStatus : String?
        
        if (observeDataInfireBase.tables[indexPath.row].available == true){
            color = Clr.tableAvailable!
            tableStatus = K.ledig
            
        }else if (observeDataInfireBase.tables[indexPath.row].available == false && observeDataInfireBase.tables[indexPath.row].done == false){
            color = Clr.tableBusy
            tableStatus = K.upptagen
        }
        
        else if (observeDataInfireBase.tables[indexPath.row].available == false && observeDataInfireBase.tables[indexPath.row].done == true){
            color = Clr.doneColor!
            tableStatus = K.klar
        }
        
        let tableNumber = observeDataInfireBase.tables[indexPath.row].number + tableStatus!
        cell.setUpTalesContent(tableNumber: tableNumber , color: color!)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if (observeDataInfireBase.tables[indexPath.row].available == true){
            let tableNumber = observeDataInfireBase.tables[indexPath.row].number
            performSegue(withIdentifier: K.toTakeOrderView, sender: tableNumber)
            
        }else{
            Msg.sendMsg(controller: self, msg:  Msg.takenTable)
        }
    }
    
    // cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if (view.frame.width > CGFloat(Nr.fiveHundred) && view.frame.height > CGFloat(Nr.fiveHundred)){
            return CGSize(width: Nr.twoHundred , height: Nr.oneHundred)
        }else{
            return CGSize(width: Nr.oneHundred , height: Nr.fifty)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let takeOrderView = segue.destination as! TakeOrderViewController
        takeOrderView.table.number =  String (sender as! String)
    }
    
}





















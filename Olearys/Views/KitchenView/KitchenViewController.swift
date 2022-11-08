
import UIKit


class KitchenViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource ,  UICollectionViewDelegateFlowLayout  {
    
    @IBOutlet weak var guestWishTextView: UITextView!
    @IBOutlet weak var tableNumberLabel: UILabel!
    @IBOutlet weak var orderInKichenCollectionView: UICollectionView!
    @IBOutlet weak var addGuestWishButton: UIButton!
    @IBOutlet weak var cancelGuestWishButton: UIButton!
    
    let observeDataInFireBase = ObserveDataInfireBase()
    let updatedataInFireBase = UpdataDataInFireBase()
    var extraguest : Guest?
    var table = Table()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableNumberLabel.text = "\(K.bord) \(table.number)"
        hideAndShowComponenet()
        // this get data by observe. change to getdata later
        observeDataInFireBase.getOneTableInformation(tableNumber: table.number) { [self] in
            orderInKichenCollectionView.reloadData()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return observeDataInFireBase.table.guests.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.ordersInKitchenCollectionViewCell, for: indexPath) as! OrdersInKitchenCollectionViewCell
        
        let guest = observeDataInFireBase.table.guests[indexPath.row]
        cell.guestNumberLabel.text = guest.number
        
        if (guest.guestHasWish == true && guest.guestWishDone == true){
            
            cell.guestNumberLabel.backgroundColor = Clr.turquoiseColor
            
        }else if  (guest.guestHasWish == true && guest.guestWishDone == false && guest.guestWishes != ""){
            
            cell.guestNumberLabel.backgroundColor = Clr.tableBusy
        }else{
            
            cell.guestNumberLabel.backgroundColor = Clr.tableAvailable
        }
        
        cell.types = observeDataInFireBase.table.guests[indexPath.row].types
        cell.guestOrderTableView.reloadData()
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let guest = observeDataInFireBase.table.guests[indexPath.row]
        if (guest.guestHasWish == true){
            showGuestwishes(guest: guest)
        }
    }
    
    
    @IBAction func OrderKlarButton(_ sender: Any) {
        controllIfOrderhaveDone()
    }
    
    func controllIfOrderhaveDone(){
        for guest in observeDataInFireBase.table.guests{
            
            if (guest.guestWishDone == false){
                Msg.sendMsg(controller: self, msg:  Msg.orderDosentDone)
                return
                
            }
            for type in guest.types{
                if (type.done == false){
                    Msg.sendMsg(controller: self, msg:  Msg.orderDosentDone)
                    return
                }
            }
            
        }
        updatedataInFireBase.AvslutaOrderIKitchen(tableNumber: table.number)
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func addGuestWishButton(_ sender: Any) {
        extraguest?.guestWishDone = true
        orderInKichenCollectionView.reloadData()
        hideAndShowComponenet()
    }
    
    @IBAction func cancelGuestWishButton(_ sender: Any) {
        hideAndShowComponenet()
    }
}

extension KitchenViewController{
    
    func showGuestwishes (guest : Guest){
        
        extraguest = guest
        guestWishTextView.text = guest.guestWishes
        guestWishTextView.isHidden = false
        addGuestWishButton.isHidden = false
        cancelGuestWishButton.isHidden = false
        self.navigationItem.hidesBackButton = true
    }
    
    func hideAndShowComponenet(){
        guestWishTextView.isHidden = true
        addGuestWishButton.isHidden = true
        cancelGuestWishButton.isHidden = true
        self.navigationItem.hidesBackButton = false
    }
    
    
    
    // cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: orderInKichenCollectionView.frame.width / 3.1 , height: orderInKichenCollectionView.frame.height - 10)
    }
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        if(size.width > self.view.frame.size.width){
            print("landscape")
            orderInKichenCollectionView.reloadData()
        }
        else{
            print("Portrait")
            orderInKichenCollectionView.reloadData()
        }
    }
    
}


import UIKit

class TakeOrderViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource , UITableViewDelegate , UITableViewDataSource , UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var guestorderCollectionView: UICollectionView!
    @IBOutlet weak var menuTableView: UITableView!
    @IBOutlet weak var guestNumberLabel: UILabel!
    @IBOutlet weak var tableSum: UIBarButtonItem!
    @IBOutlet weak var dessertsBtn: UIButton!
    @IBOutlet weak var drinksBtn: UIButton!
    @IBOutlet weak var foodBtn: UIButton!
    @IBOutlet weak var kidsBtn: UIButton!
    
    @IBOutlet weak var guestWishTextView: UITextView!
    @IBOutlet weak var addGuestWish: UIButton!
    @IBOutlet weak var cancelGuestWishButton: UIButton!
 
    var whichMenu = ShowMenu.foodMenus
    var guest = Guest(number: Nr.oneAsStrinbg)
    let setDataInFireBase = SetDataInFireBase()
    let cancelOrderButton = UIBarButtonItem()
    let desertsMenu = DessertsMenus()
    let drinkMenu = DrinksMenus()
    let kidsMenus = KidsMenus()
    let foodMenu = FoodMenus()
    let table = Table()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resizeComponent()
        
        hideGuestWishTextViewForAddingWish()
        showTableNumberInNavigationItem()
        table.guests.append(guest)
        showGuestInformation()
        cancelOrderButton.title = K.avbryt
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = cancelOrderButton
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (whichMenu == ShowMenu.foodMenus){
            return foodMenu.foodMenus.count
            
        } else if (whichMenu == ShowMenu.drinksMenus){
            return drinkMenu.drinksmenu.count
            
        } else if (whichMenu == ShowMenu.dessertsMenus){
            return desertsMenu.allDessertsMenus.count
        }else{
            return kidsMenus.kidsMenu.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =  tableView.dequeueReusableCell(withIdentifier: K.menuCell, for: indexPath) as! MenuTableViewCell
        
        if (whichMenu == ShowMenu.foodMenus){
            
            cell.menuTittlelabel.text = foodMenu.foodMenus[indexPath.row].tittle
            cell.menu = foodMenu.foodMenus[indexPath.row].types
            
        } else if (whichMenu == ShowMenu.drinksMenus){
            
            cell.menuTittlelabel.text = drinkMenu.drinksmenu[indexPath.row].tittle
            cell.menu = drinkMenu.drinksmenu[indexPath.row].types
            
        } else if (whichMenu == ShowMenu.dessertsMenus){
            
            cell.menuTittlelabel.text = desertsMenu.allDessertsMenus[indexPath.row].tittle
            cell.menu = desertsMenu.allDessertsMenus[indexPath.row].types
            
        }else{
            
            cell.menuTittlelabel.text = kidsMenus.kidsMenu[indexPath.row].tittle
            cell.menu = kidsMenus.kidsMenu[indexPath.row].types
        }
        
        cell.takeOrderViewController = self
        cell.menuCollectionView.reloadData()
        
        return cell
    }
    
    // collectionView shows the food which guest order
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return guest.types.count
    }
    
    // collectionView shows the food which guest order
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: K.guestOrderCell, for: indexPath) as! GuestOrdersCollectionViewCell
        cell.deleteOrderButton.tag = indexPath.row
        cell.deleteOrderButton.addTarget(self, action: #selector(deleteGuestOrder(sender:)), for: .touchUpInside)
        cell.guesrOrderLabel.text = guest.types[indexPath.row].name
        
        return cell
    }
    
    // collectionView shows the food which guest order
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (view.frame.width > 500 && view.frame.height > 500){
            
            return CGSize(width: Nr.twoHundred  , height: Nr.ninety)
        }else{
            return CGSize(width: Nr.hundredTwenty  , height: Nr.ninety)
        }
    }
    
    
    func showGuestOrder (type : Type){
        guest.makeOrder(type: type)
        showGuestInformation()
        updateTableInformation()
        guestorderCollectionView.reloadData()
    }
    
    func showGuestInformation (){
        guestNumberLabel.text = "\(K.gast) \(guest.number) \(K.summa) \(guest.sum)"
        
    }
    
    
    @objc
    func deleteGuestOrder (sender : UIButton){
        guest.regretOrder(index: sender.tag)
        updateGuestInformation()
        updateTableInformation()
    }
    
    @IBAction func buttonNextGuest(_ sender: Any) {
        
        if (guest.types.count == Nr.zero){
         Msg.sendMsg(controller: self, msg: Msg.guestDosentOrdered)
        }else{
            
            let nextGuestNumber = String (table.guests.count + Nr.one)
            let newGuest = Guest(number: nextGuestNumber)
            guest = newGuest
            table.guests.append(guest)
            updateGuestInformation()
            updateTableInformation()
        }
    }
    
    @IBAction func buttonSendOrder(_ sender: Any) {
        
        if (table.sum == Nr.zeroPonitZero){
            Msg.sendMsg(controller:self, msg: Msg.tableHaseNoOrder)
        }else{
            confirmeSendingOrder()
            
        }
    }
    
    func updateGuestInformation(){
        showGuestInformation()
        guestorderCollectionView.reloadData()
    }
    
    func updateTableInformation(){
        table.getTableSum()
        tableSum.title = "\(table.sum)  "
    }
    
    @IBAction func addGuestWish(_ sender: Any) {
        guest.guestWishes = guestWishTextView.text
        guest.guestHasWish = true
        guest.guestWishDone = false
        hideGuestWishTextViewForAddingWish()
    }
    
    @IBAction func CanceladdGuestWish(_ sender: Any) {
        hideGuestWishTextViewForAddingWish()
    }
}

extension TakeOrderViewController {
    @IBAction func foodButton(_ sender: Any) {
        whichMenu = ShowMenu.foodMenus
        menuTableView.reloadData()
        giveAllButtonRedColor(pressedButton:foodBtn )
    }
    
    @IBAction func drinksButton(_ sender: Any) {
        whichMenu = ShowMenu.drinksMenus
        menuTableView.reloadData()
        giveAllButtonRedColor(pressedButton: drinksBtn)
        
    }
    
    @IBAction func dessertsButton(_ sender: Any) {
        whichMenu = ShowMenu.dessertsMenus
        menuTableView.reloadData()
        giveAllButtonRedColor(pressedButton: dessertsBtn)
    }
    
    @IBAction func kidsbutton(_ sender: Any) {
        whichMenu = ShowMenu.kidsMenus
        menuTableView.reloadData()
        giveAllButtonRedColor(pressedButton: kidsBtn)
    }
    
    func giveAllButtonRedColor (pressedButton : UIButton){
        foodBtn.titleLabel?.tintColor = .gray
        drinksBtn.titleLabel?.tintColor = .gray
        dessertsBtn.titleLabel?.tintColor = .gray
        kidsBtn.titleLabel?.tintColor = .gray
        pressedButton.titleLabel?.tintColor = .white
    }
    
    //____code for add guest wishes ----------------------------------------------------
    @IBAction func addguestWishbutton(_ sender: Any) {
        
        self.navigationItem.hidesBackButton = true
        guestWishTextView.text = guest.guestWishes
        showGuestWishTextViewForTakingWish()
    }
    
    func hideGuestWishTextViewForAddingWish(){
        guestWishTextView.isHidden = true
        addGuestWish.isHidden = true
        cancelGuestWishButton.isHidden = true
        self.navigationItem.hidesBackButton = false
       // showTableNumberInNavigationItem()
        //this function  dismiss keyborad
        
        view.endEditing(true)
    }
    
    func showGuestWishTextViewForTakingWish(){
        guestWishTextView.isHidden = false
        guestWishTextView.text = guest.guestWishes
        addGuestWish.isHidden = false
        cancelGuestWishButton.isHidden = false
        self.navigationItem.hidesBackButton = true
        
    }
    
    func showTableNumberInNavigationItem(){
        tableSum.title = "\(table.sum)"
        self.title = "\(K.bord) \(table.number) \(K.helaSumma)"
    }
    
    func confirmeSendingOrder (){
        
        let dialogMessage = UIAlertController(title: K.bekrafta, message: K.bekraftaMsg, preferredStyle: .actionSheet)
        
        let jaKnapp = UIAlertAction(title: K.ja, style: .destructive, handler: { [self] (action) -> Void in
            
            if (guest.sum == Nr.zeroPonitZero){
                let guestNumber = table.guests.count - Nr.one
                table.guests.remove(at: guestNumber)
            }
            setDataInFireBase.sendOrderToFireBase(table: table)
            for vc in self.navigationController!.viewControllers {
                if let myViewCont = vc as? MainViewController
                {
                    self.navigationController?.popToViewController(myViewCont, animated: true)
                }
            }
        })
        
        let nejKnapp = UIAlertAction(title: K.nej, style: .default, handler: { (action) -> Void in
        })
        
        dialogMessage.addAction(nejKnapp)
        dialogMessage.addAction(jaKnapp)
        self.present(dialogMessage, animated: true, completion: nil)
    }
    
    func resizeComponent (){
        let viewWidth = Float (view.frame.width)
        tableSum.title = "\(table.sum)"
        tableSum.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: F.baskerville, size: CGFloat(viewWidth) / CGFloat(Nr.twenty))!], for: .normal)
        navigationController?.navigationBar.titleTextAttributes =
        [NSAttributedString.Key.font : UIFont(name: F.baskerville, size: CGFloat(viewWidth) / CGFloat(Nr.twentyFive))! , .foregroundColor: UIColor.systemGray6]
        }
    
}




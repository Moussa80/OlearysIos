
import Foundation
import Firebase

class UpdataDataInFireBase {
    
    var ref :  DatabaseReference!
    
    init(){
        ref = Database.database().reference()
    }
    
    
    func AvslutaOrderIKitchen (tableNumber : String){
        
            ref.child(FBChild().olearysEntre)
            .child(FBChild().tables).child(tableNumber).child(FBChild().done).setValue(true)
    
    }
    
    
    
}

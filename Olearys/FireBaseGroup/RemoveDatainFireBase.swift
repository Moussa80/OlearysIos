
import Foundation
import Firebase

class RemovaDataInFireBase {
    
    
    var ref :  DatabaseReference!
    
    init(){
        ref = Database.database().reference()
    }
    
    func TablePaid (tableNumber : String){
        
        let table =  ref.child(FBChild().olearysEntre).child(FBChild().tables).child(tableNumber)
        let tableAsDectionary : [String : Any] =
        
        [
            FBChild().tableNumber : tableNumber,
            FBChild().hasOrder : false,
            FBChild().paid : true,
            FBChild().available : true,
            FBChild().done : false,
            FBChild().tableSum : 0.0
            
        ]
        
        table.updateChildValues(tableAsDectionary)
        table.child(FBChild().guests).removeValue()
    }
    
    
    
}

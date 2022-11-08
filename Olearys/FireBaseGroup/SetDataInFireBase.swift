
import Foundation
import Firebase

class SetDataInFireBase {
    
    var ref :  DatabaseReference!
    let wichTable : DatabaseReference!
    
    init(){
        
        ref = Database.database().reference()
        wichTable = ref.child(FBChild().olearysEntre).child(FBChild().tables)
    }
    
    
    
    func sendOrderToFireBase(table : Table){
        
        let tableAsDectionary : [String : Any] =
        
        [
            FBChild().hasOrder : true,
            FBChild().paid : false,
            FBChild().available : false,
            FBChild().tableSum : table.sum,
            FBChild().tableNumber : table.number,
            FBChild().done : false
        ]
        
        
        wichTable.child(table.number).setValue(tableAsDectionary)
        
        let guestsInFB =  wichTable.child(table.number).child(FBChild().guests)
        
        for guest in table.guests{
            guestsInFB.child(guest.number).child(FBChild().guestSum).setValue(guest.sum)
            guestsInFB.child(guest.number).child(FBChild().guestnumber).setValue(guest.number)
            guestsInFB.child(guest.number).child(FBChild().guestWishses).setValue(guest.guestWishes)
            guestsInFB.child(guest.number).child(FBChild().guestHasWish).setValue(guest.guestHasWish)
            guestsInFB.child(guest.number).child(FBChild().guestWishDone).setValue(guest.guestWishDone)
            guestsInFB.child(guest.number).child(FBChild().guestHasPaid).setValue(guest.guestHasPaid)
            
            for (index, type) in guest.types.enumerated(){
                
                let typeNumber = String(index  )
                guestsInFB.child(guest.number).child(FBChild().guestsOrder).child(typeNumber).child(FBChild().typeName).setValue(type.name)
                guestsInFB.child(guest.number).child(FBChild().guestsOrder).child(typeNumber).child(FBChild().typePrice).setValue(type.price)
            }
            
        }
    }
    
    
    
    
    
    
    
    
 
    
    
}


import Foundation
import Firebase

class ObserveDataInfireBase {
    
    var ref :  DatabaseReference!
    var tables : [Table] = []
    var tableshavePayment = [Table] ()
    var tableshaveOrders = [Table] ()
    
    let table = Table()
    
    init(){
        ref = Database.database().reference()
    }
    
    
    
    func getTables ( completionHand: @escaping () -> ()){
        
        ref.child(FBChild().olearysEntre).child(FBChild().tables).observe(DataEventType.value, with: { snapshot in
            
            self.tables.removeAll()
            for   dataAsoneSnapShot in snapshot.children {
                
                let  oneSnapshot =  dataAsoneSnapShot as! DataSnapshot
                let  tableAsDectionary = oneSnapshot.value as! [String : AnyObject]
                
                let table = Table()
                table.number = tableAsDectionary[FBChild().tableNumber] as! String
                table.available = tableAsDectionary[FBChild().available] as! Bool
                table.done =  tableAsDectionary[FBChild().done] as! Bool
                
                
                self.tables.append(table)
            }
            
            completionHand()
            
        });
    }
    
    
    
    
    func getTablesWhichHavePayment ( completionHand: @escaping () -> ()){
        
        ref.child(FBChild().olearysEntre).child(FBChild().tables).observe(DataEventType.value, with: { snapshot in
            
            self.tableshavePayment.removeAll()
            for   dataAsoneSnapShot in snapshot.children {
                
                let  oneSnapshot =  dataAsoneSnapShot as! DataSnapshot
                
                
                let  tableAsDectionary = oneSnapshot.value as! [String : AnyObject]
                
                let table = Table()
                table.number = tableAsDectionary[FBChild().tableNumber] as! String
                table.paid = tableAsDectionary[FBChild().paid] as! Bool
                table.sum = tableAsDectionary[FBChild().tableSum] as! Double
                table.done = tableAsDectionary[FBChild().done] as! Bool
                
                if (table.paid == false && table.done == true){
                    self.tableshavePayment.append(table)
                }
                
            }
            
            
            completionHand()
            
        });
        
        
        
    }
    
    
    
    func getTablesWhichHaveOrder ( completionHand: @escaping () -> ()){
        
        ref.child(FBChild().olearysEntre).child(FBChild().tables).observe(DataEventType.value, with: { snapshot in
            
            self.tableshaveOrders.removeAll()
            for   dataAsoneSnapShot in snapshot.children {
                
                let  oneSnapshot =  dataAsoneSnapShot as! DataSnapshot
                
                
                let  tableAsDectionary = oneSnapshot.value as! [String : AnyObject]
                
                let table = Table()
                table.number = tableAsDectionary[FBChild().tableNumber] as! String
                table.hasOrder = tableAsDectionary[FBChild().hasOrder] as! Bool
                table.done = tableAsDectionary[FBChild().done] as! Bool
                
                
                if (table.hasOrder == true && table.done == false){
                    self.tableshaveOrders.append(table)
                }
                
            }
            
            
            completionHand()
            
        });
        
    }
    
    
    
    
    
    func getOneTableInformation (tableNumber : String ,  completionHand: @escaping () -> ()){
        
        ref.child(FBChild().olearysEntre).child(FBChild().tables).child(tableNumber).child(FBChild().guests).observe(DataEventType.value, with: { [self] snapshot in
            
            for   data1 in snapshot.children {
                
                let  dataSnapshot =  data1 as! DataSnapshot
                let  guestAsSnapShot = dataSnapshot.value as! [String : AnyObject]
                
                if let guestSum =  guestAsSnapShot[FBChild().guestSum] as? Double {
                    if let guestNumber = guestAsSnapShot[FBChild().guestnumber] as? String{
                        if let guestWishes = guestAsSnapShot[FBChild().guestWishses] as? String{
                            if let guestHasWish = guestAsSnapShot[FBChild().guestHasWish] as? Bool{
                                if let guestWishDone = guestAsSnapShot[FBChild().guestWishDone] as? Bool {
                                    if let guestHasPaid = guestAsSnapShot[FBChild().guestHasPaid] as? Bool {
                                    
                                    let guest = Guest(number: guestNumber)
                                    guest.sum = guestSum
                                    guest.guestHasPaid = guestHasPaid
                                    guest.guestWishes = guestWishes
                                    guest.guestHasWish = guestHasWish
                                    guest.guestWishDone = guestWishDone
                                    
                                    if let types = guestAsSnapShot[FBChild().guestsOrder] as? [AnyObject]{
                                        
                                        for type in types{
                                            
                                            var name = ""
                                            var price = 0.0
                                            
                                            if  let typeName =  type[FBChild().typeName] as? String{
                                                name = typeName
                                                
                                            }
                                            if let typePrice = type[FBChild().typePrice] as? Double{
                                                
                                                price = typePrice
                                                
                                            }
                                            
                                            let typeObject = Type(name: name, price: price)
                                            guest.types.append(typeObject)
                                            
                                        }
                                        
                                        
                                    }
                                    self.table.guests.append(guest)
                                    
                                }
                            }
                            
                        }
                        
                    }
                    
                }
            }
                
            }
            completionHand()
            
        });
        
    }
    
}

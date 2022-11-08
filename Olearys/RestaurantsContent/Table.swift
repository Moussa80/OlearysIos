
import Foundation


class Table {
  
    
    var guests : [Guest] = []
    var number = ""
    var sum = 0.0
    var available = true
    var paid = false
    var hasOrder = false
    var done = false
  
    
    func getTableSum(){
        self.sum = 0.0
        for guest in self.guests {
            self.sum += guest.sum
        }
    }
    
   
   
    
    
    
}

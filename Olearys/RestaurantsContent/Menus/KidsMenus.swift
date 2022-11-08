
import Foundation


class KidsMenus {
    
    let kidsFoodMenu = Menu()
    let kidsDessertsMenu = Menu()
    var kidsMenu = [Menu]()
    
    init(){
        
        // Kids Food
        let cheesBurger = Dessert(name: "Cheeseburger", price: 69.0 )
        let fishAndChips = Dessert(name: "FISH & CHIPS", price: 69.0 )
        let chickenNuggets = Dessert(name: "CHICKEN NUGGETS", price: 69.0 )
        let quesadilla = Dessert(name: "quesadilla", price: 69.0 )
        
        self.kidsFoodMenu.tittle = "Kids Menu"
        self.kidsFoodMenu.types = [cheesBurger,fishAndChips,chickenNuggets,quesadilla]
        
        //---------------------------------------------------------------------------------
        // Kids Desserts
        let brownie = Dessert(name: "BROWNIE", price: 35.0)
        let sundae = Dessert(name: "SUNDAE", price: 29.0)
        let pancakes = Dessert(name: "PANCAKES", price: 29.0 )
        
        self.kidsDessertsMenu.tittle = "Kids Desserts"
        self.kidsDessertsMenu.types = [brownie,sundae, pancakes]
        
        self.kidsMenu = [kidsFoodMenu,kidsDessertsMenu]
        
    }
    
}


import Foundation



class DessertsMenus {
   
    
    var dessertsMenu = Menu()
    var coffeDrinksMenu = Menu()
    var avecMenu = Menu()
    
    var allDessertsMenus = [Menu]()
    
    init (){
        
        
        //1 Desserts -> belogs to desserts menu
         let chooclateBrowine =  Dessert(name: "CHOCOLATE BROWNIE", price: 59.0)
         let sweetLemonTiramisu = Dessert(name: " SWEET LEMON TIRAMISU", price:39.0)
         let deepFiedBroWine  = Dessert(name: "DEEP FRIED BROWNIE", price:29.0)
         let iceCreamSundae   = Dessert(name: "ICE CREAM SUNDAE", price:49.0)
         let cheeseCake   = Dessert(name: "CHEESE CAKE", price:59.0)
         let strawberryMilkshake = Dessert(name: "STRAWBERRY MILKSHAKE", price:69.0 )
         let chocolateMilkshake = Dessert(name: "CHOCOLATE MILKSHAKE", price:69.0 )
       
         self.dessertsMenu.tittle = "Desserts"
         self.dessertsMenu.types = [chooclateBrowine,sweetLemonTiramisu,deepFiedBroWine,
            iceCreamSundae,cheeseCake,strawberryMilkshake,chocolateMilkshake]
        //------------------------------------------------------------------------------------------
        
        
         //2 COFFEE DRINKS -> belogs to desserts menu
        let espressomartini = Dessert(name: "ESPRESSO MARTINI", price: 119.0)
        let tullamore = Dessert(name: "ULLAMORE IRISH COFFEE", price: 119.0)
        let gallianoMartini = Dessert(name: "GALLIANO MARTINI", price: 119.0)
        let jamaicanCoffe = Dessert(name: "JAMAICAN COFFEE", price: 119.0)
        let coffe = Dessert(name: "COFFEE", price: 29.0)
        let tea = Dessert(name: "TEA", price: 29.0)
        let espressoSmall = Dessert(name: "ESPRESSO SMALL", price: 29.0)
        let espressoBig = Dessert(name: "ESPRESSO BIG", price: 39.0)
        let cappucciono = Dessert(name: "CAPPUCCINO", price: 45.0)
        let coffeLatte  = Dessert(name: "CAFFE LATTE", price: 45.0)
        
        self.coffeDrinksMenu.tittle = "Cooffe"
        self.coffeDrinksMenu.types = [espressomartini,tullamore,gallianoMartini,jamaicanCoffe,coffe,tea,
                                          espressoSmall,espressoBig,cappucciono,coffeLatte]
        //------------------------------------------------------------------------------------------
        
        
        //3 AVEC -> belogs to desserts menu
        let braastadVs = Dessert(name: "BRAASTAD VS", price: 112.0)
        let boulardCalvados = Dessert(name: "BOULARD CALVADOS", price: 120.0)
        let makersMars = Dessert(name: "MAKERS MARK", price: 112.0)
        let limoncelloVillaMassa = Dessert(name: "LIMONCELLO VILLA MASSA", price: 100.0)
        let bacardiSpiced = Dessert(name: "BACARDI SPICED", price: 100.0)
        let gentelmanJack = Dessert(name: "GENTLEMAN JACK", price: 144.0)
        let jackDaniels = Dessert(name: "JACK DANIELS", price: 112.0)
        let jimBean = Dessert(name: "JIM BEAM", price: 100.0)
        
        let famousGrouse = Dessert(name: "FAMOUS GROUSE", price: 104.0)
        let highlandPark12 = Dessert(name: "HIGHLAND PARK 12", price: 112.0)
        let macallanDbCask12 = Dessert(name: "MACALLAN DB CASK 12", price: 144.0)
        let laphroaig10 = Dessert(name: "LAPHROAIG 10", price: 112.0)
        let theKraken = Dessert(name: "THE KRAKEN", price: 100.0)
        let bacaradi8Anos = Dessert(name: "BACARDI 8 AÑOS", price: 112.0)
        let baileys = Dessert(name: "BAILEYS", price: 88.0)
        let vaccariSambuca = Dessert(name: "VACCARI SAMBUCA", price: 94.0)
        
        self.avecMenu.tittle = "Avec"
        self.avecMenu.types = [braastadVs,boulardCalvados,makersMars,limoncelloVillaMassa,bacardiSpiced,
                        gentelmanJack,jackDaniels,jimBean,famousGrouse,highlandPark12,laphroaig10,theKraken,bacaradi8Anos,baileys,vaccariSambuca]
        
        self.allDessertsMenus = [dessertsMenu,coffeDrinksMenu,avecMenu]
            
        }
    
    
}

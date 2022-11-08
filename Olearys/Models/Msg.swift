
import Foundation
import UIKit


class Msg {
    
    static let emptyAccess = "Var vänlig Fyll i ditt lösenord och användarnamn för att logga in"
    static let noAccess = "Du har ej access"
    static let guestDosentOrdered = "Denna gäst har inte beställt något"
    static let tableHaseNoOrder = "Det finns ingen order att skicka"
    static let takenTable = "Detta bordet är upptaget"
    static let emptyusername = "Var vänlig Fyll i ditt användarnamn"
    static let emptypassword = "Var vänlig Fyll i ditt lösenord"
    static let orderDosentDone = "order är inte klar"
    static let guestHaventpaid = "Inte alla gäst har betalt"
    
    static func sendMsg (controller : UIViewController ,  msg : String){
        let dialogMessage = UIAlertController(title: "Warning", message: msg, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default, handler: { (action) -> Void in
        })
        dialogMessage.addAction(ok)
        controller.present(dialogMessage, animated: true, completion: nil)
    }
    
    
}

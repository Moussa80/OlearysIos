
import Foundation
import UIKit

class ControlInput {
    
    
    
   static func controlEmptyInput (userNameTextField : UITextField ,  passWrordTextField : UITextField , viewController : UIViewController){
        
        let username = userNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passWrordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let access = "\(username)\(password)"
        
        if (access.isEmpty) {
            Msg.sendMsg(controller: viewController, msg:  Msg.emptyAccess)
        }
        if (username.isEmpty) {
            Msg.sendMsg(controller: viewController, msg:  Msg.emptyusername)
        }
        
        if (password.isEmpty) {
            Msg.sendMsg(controller: viewController, msg:  Msg.emptypassword)
        }
        controllAccess(input: access , viewController: viewController )
    }
    
  static  func controllAccess(input : String,viewController : UIViewController ){
        if (input == Access.alexK || input == Access.saraK || input == Access.kithen){
            let vc = viewController.storyboard?.instantiateViewController(withIdentifier: K.tableWithOrder) as! TableWithOrderViewController
            viewController.navigationController?.pushViewController(vc, animated: true)
        }else if (input == Access.davidW || input == Access.dinaW || input == Access.waiter){
            let vc = viewController.storyboard?.instantiateViewController(withIdentifier: K.MinView ) as! MainViewController
           viewController.navigationController?.pushViewController(vc, animated: true)
        }else{
            Msg.sendMsg(controller: viewController, msg: Msg.noAccess)
        }
    }
    
    
    
}

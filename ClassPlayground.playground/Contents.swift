//: Playground - noun: a place where people can play

import UIKit


enum FavoriteColor {
    case Black
    case White
    case Blue
    case Orange
    case Purple
    case Magenta
    case Grey

}



class User {
    
    
    var name: String
    var password: String
    var email: String
    var favoriteColor: FavoriteColor?
    
    func sayHello(name: String) {
        print("Hello \(name)")
    
    }
    
    func register(name: String, password: String) {
        self.name = name
        self.password = password
        print("You are now registered")
    }
    
    func logIn(name: String, passsword: String) {
        
        if name == name {
            if passsword == passsword {
                print("\(name) is now logged in.")
                
                
            } else if passsword != password {
                print("Wrong Password")
            }
        } else if name != name {
            print("Sorry, I don't recognize the name \(name)")
        }
        else {
            print("Try again")
        }
        
    }
    
    func logOut() {
        print("\(name) is now logged out.")
    }
    
    init(name: String, password: String, favoriteColor: FavoriteColor?) {
        self.email = "\(name)@ironyard.com"
        self.name = name
        self.password = password
        self.favoriteColor = FavoriteColor.White
        
        
        if favoriteColor != nil {
            self.favoriteColor = favoriteColor
        
        }
            
        
        
    }
}




let kelly = User(name: "Kelly", password: "password", favoriteColor: nil)


protocol ColorRepresentable {
    
    var favColorAsUIColor: UIColor? { get }
    
}




extension User: ColorRepresentable {
    
    var favColorAsUIColor: UIColor? {
        get {
            if let x = favoriteColor {
                switch x {
                case .Black: return UIColor.blackColor()
                case .Blue: return UIColor.blueColor()
                case .Grey: return UIColor.grayColor()
                case .Magenta: return UIColor.magentaColor()
                case .Orange: return UIColor.orangeColor()
                case .Purple: return UIColor.purpleColor()
                case .White: return UIColor.whiteColor()
                }
            }
            return nil
        }
        
    }
    
}

kelly.favoriteColor = .Magenta

kelly.favColorAsUIColor





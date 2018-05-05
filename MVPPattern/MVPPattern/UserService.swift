/******************************************************************************
 *  Purpose: Model Class.
 *
 *  @author Rohini
 *  @version 4.0
 *  @since   15-04-2018
 *
 ******************************************************************************/
import Foundation
struct User {
    let firstName: String
    let lastName: String
    let email: String
    let age: Int
}
class UserService {
    
    func getUsers(callBack:([User]) -> Void){
        let users = [User(firstName: "Iyad", lastName: "Agha", email: "iyad@test.com", age: 36),
                     User(firstName: "Mila", lastName: "Haward", email: "mila@test.com", age: 24),
                     User(firstName: "Mark", lastName: "Astun", email: "mark@test.com", age: 39)
        ]
        
        callBack(users)
    }
}

//
//  ViewController.swift
//  RealmDemo
//
//  Created by chander bhushan on 18/06/19.
//  Copyright © 2019 SwiftSeries. All rights reserved.
//

import UIKit
import RealmSwift
class ViewController: UIViewController {

    let realMInstance = try! Realm()
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    func makeUserWithName(_ name:String, pet:Pet?) -> User {
        let newUser = User()
        newUser.name = name
        newUser.pet = pet
        return newUser
    }
    
    func makePetWithName(_ name:String, owner:User?) -> Pet{
        let newPet = Pet()
        newPet.petName = name
        newPet.owner = owner
        return newPet
    }
    
    
    
    @IBAction func clickedBtnSave(_ sender: Any) {
        
        let newPet = self.makePetWithName("Spot", owner: nil)
        let newUser = self.makeUserWithName("john", pet: newPet)
        let newPet1 = self.makePetWithName("Puppy", owner: nil)
        let newUser1 = self.makeUserWithName("Adriana", pet: newPet)
        let newPet2 = self.makePetWithName("Dubby", owner: nil)
        let newUser2 = self.makeUserWithName("Test", pet: newPet)
        
        try! realMInstance.write {
            realMInstance.add(newPet)
            realMInstance.add(newUser)
            realMInstance.add(newPet1)
            realMInstance.add(newUser1)
            realMInstance.add(newPet2)
            realMInstance.add(newUser2)

        }
        
    }
    
    @IBAction func clickedBtnUpdate(_ sender: Any) {
        
        if  let user = realMInstance.objects(User.self).filter(NSPredicate(format: "name = %@", textField.text ?? "No Name")).first {
            try! realMInstance.write {
                user.name = "James"
                if let pet = user.pet
                {
                    pet.petName = "Jack"
                }
            }
            print(realMInstance.objects(User.self).first)
        }else{
            print("User Not Found!")
        }
    }
    

    @IBAction func clickedBtnDelete(_ sender: Any) {
        if  let user = realMInstance.objects(User.self).filter(NSPredicate(format: "name = %@", textField.text ?? "No Name")).first {
            try! realMInstance.write {
                realMInstance.delete(user)
            }
            print("user is deleted successfully!")
        }else{
            print("User Not Found!")
        }
    }
    
    @IBAction func clickedBtnFind(_ sender: Any) {
        if  let user = realMInstance.objects(User.self).filter(NSPredicate(format: "name = %@", textField.text ?? "No Name")).first {
            print(user)
        }else{
            print("User Not Found!")
        }
    }
    
    @IBAction func clickedBtnFetchAll(_ sender: Any) {
        
        let users = realMInstance.objects(User.self)
        
        for user in users{
            print(user)
        }
        
    }
    
    
}


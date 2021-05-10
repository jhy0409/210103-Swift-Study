//
//  ViewController.swift
//  Firebase101
//
//  Created by inooph on 2021/05/10.
//

import UIKit
import Firebase
class ViewController: UIViewController {
    
    @IBOutlet weak var dataLable: UILabel!
    @IBOutlet weak var numOfCustomers: UILabel!
    let db = Database.database().reference()
    
    var customers: [Customer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateLable()
        saveBasicTypes()
//        saveCustomers()
        fetchCustomers()
        
        // [] update, delete
//        updateBasicTypes()
//        deleteBasicTypes()
    }
    
    func updateLable() {
        db.child("firstData").observeSingleEvent(of: .value) { snapshot in
            print("---> \(snapshot)")
            
            let value = snapshot.value as? String ?? ""
            DispatchQueue.main.async {
                self.dataLable.text = value
            }
        }
    }
    
    @IBAction func createCustomer(_ sender: Any) {
        saveCustomers()
    }
    
    @IBAction func fetchCustomer(_ sender: Any) {
        fetchCustomers()
    }
    
    func updateCustomers() {
        guard customers.isEmpty == false else { return }
        customers[0].name = "Min"
        
        let dictionary = customers.map { $0.toDictionary }
        db.updateChildValues(["customers": dictionary])
    }
    
    @IBAction func updateCustomer(_ sender: Any) {
        updateCustomers()
    }
    
    func deleteCustomers() {
        db.child("customers").removeValue()
    }
    
    @IBAction func deleteCustomer(_ sender: Any) {
        deleteCustomers()
    }
}

extension ViewController {
    func saveBasicTypes () {
        // Firebase chile ("key").setValue(Value)
        // - string, number, dictionary, array
        
        db.child("int").setValue(3)
        db.child("double").setValue(3.5)
        db.child("str").setValue("string value - this is string")
        db.child("array").setValue(["a", "b", "c"])
        db.child("dict").setValue(["id": "anyID", "age": 10, "city": "seoul"])
    }
    func saveCustomers() {
        // 서점
        // 사용자 저장
        // 모델 Customer + book
        
        let books = [Book(title: "Books name", author: "someone"), Book(title: "Hcking Growth", author: "someOne")]
        
        let customer1 = Customer(id: "\(Customer.id)", name: "Person", books: books)
        Customer.id += 1
        let customer2 = Customer(id: "\(Customer.id)", name: "ABC", books: books)
        Customer.id += 1
        let customer3 = Customer(id: "\(Customer.id)", name: "DEF", books: books)
        Customer.id += 1
        
        db.child("customers").child(customer1.id).setValue(customer1.toDictionary)
        db.child("customers").child(customer2.id).setValue(customer2.toDictionary)
        db.child("customers").child(customer3.id).setValue(customer3.toDictionary)
    }
}

// Mark : Read(Fetch) Data
extension ViewController {
    func fetchCustomers() {
        db.child("customers").observeSingleEvent(of: .value) { snapshot in
            print("--> \(snapshot.value)")
            do {
                let data = try JSONSerialization.data(withJSONObject: snapshot.value, options: [])
                let decoder = JSONDecoder()
                let customers: [Customer] = try decoder.decode([Customer].self, from: data)
                self.customers = customers
                
                DispatchQueue.main.async {
                    self.numOfCustomers.text = "# of Customers: \(customers.count)"
                } // print("--> customers: \(customers.count)")
            } catch let error {
                print("--> error: \(error.localizedDescription)")
            }
        }
    }
}

extension ViewController {
    func updateBasicTypes() {
//        db.child("int").setValue(3)
//        db.child("double").setValue(3.5)
//        db.child("str").setValue("수정되었습니다.")
        db.updateChildValues(["int": 999])
        db.updateChildValues(["double": 999.999])
        db.updateChildValues(["str": "변경된 스트링"])
    }
    func deleteBasicTypes() {
        db.child("int").removeValue()
        db.child("double").removeValue()
        db.child("str").removeValue()
    }
}

struct Customer: Codable {
    let id: String
    var name: String
    let books: [Book]
    
    var toDictionary: [String: Any] {
        let booksArray = books.map { $0.toDictionary }
        let dict: [String: Any] = ["id":id, "name": name, "books": booksArray]
        return dict
    }
    
    static var id: Int = 0
}

struct Book: Codable {
    let title: String
    let author: String
    
    var toDictionary: [String: Any] {
        let dict: [String: Any] = ["title": title, "author": author]
        return dict
    }
}

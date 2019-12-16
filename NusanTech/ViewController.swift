//
//  ViewController.swift
//  NusanTech
//
//  Created by fakhry fauzan on 16/12/19.
//  Copyright © 2019 fakhry fauzan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var hasilLabel: UILabel?
    @IBOutlet weak var txtfield1: UITextField!
    @IBOutlet weak var txtfield2: UITextField!
    @IBOutlet weak var txtfield3: UITextField!
    @IBOutlet weak var cek1But: UIButton!
    @IBOutlet weak var cek2But: UIButton!
    @IBOutlet weak var cek3But: UIButton!
    var selectedButton = [UITextField]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialStart()
        hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cek1(_ sender: UIButton) {
        cekButton(sender: sender, cekBut: cek1But, textfield: txtfield1)
    }
    @IBAction func cek2(_ sender: UIButton) {
        cekButton(sender: sender, cekBut: cek2But, textfield: txtfield2)
    }
    @IBAction func cek3(_ sender: UIButton) {
        cekButton(sender: sender, cekBut: cek3But, textfield: txtfield3)
    }
    
    @IBAction func plusAksi(_ sender: Any) {
        hitung(aritmathic: 1)

    }
    @IBAction func minusAksi(_ sender: Any) {
        hitung(aritmathic: 2)
    }
    @IBAction func kaliAksi(_ sender: Any) {
        hitung(aritmathic: 3)
    }
    @IBAction func bagiAksi(_ sender: Any) {
        hitung(aritmathic: 4)
    }
    
}
extension ViewController{
    func reduce(sign: (Int,Int)->Int) -> Int{
        
        return sign(2,3)
    }
    func hitung(aritmathic: Int){
        
        if selectedButton.count  == 3{
            selectedButton = [txtfield1, txtfield2, txtfield3]
            guard let first = selectedButton[0].text else {return}
            guard let second = selectedButton[1].text else {return}
            guard let third = selectedButton[2].text else {return}
            if first.isEmpty == true || second.isEmpty == true || third.isEmpty == true {alert(alert: "TextField Tidak Boleh Kosong")}
            else{
                if aritmathic == 1{
                    hasilLabel?.text = String(Int(first)! + Int(second)! + Int(third)!)
                }else if aritmathic == 2 {
                    hasilLabel?.text = String(Int(first)! - Int(second)! - Int(third)!)
                }else if aritmathic == 3 {
                    hasilLabel?.text = String(Int(first)! * Int(second)! * Int(third)!)
                }else if aritmathic == 4 {
                    hasilLabel?.text = String(Float(first)! / Float(second)! / Float(third)!)
                }
                
            }
            
        }else if selectedButton.count == 2 {
            guard let first = selectedButton[0].text else {return}
            guard let second = selectedButton[1].text else {return}
            if first.isEmpty == true || second.isEmpty == true{alert(alert: "TextField Tidak Boleh Kosong")}
            else{
                if aritmathic == 1{
                   hasilLabel?.text = String(Int(first)! + Int(second)!)
                }else if aritmathic == 2 {
                    hasilLabel?.text = String(Int(first)! - Int(second)!)
                }else if aritmathic == 3 {
                    hasilLabel?.text = String(Int(first)! * Int(second)!)
                }else if aritmathic == 4 {
                    hasilLabel?.text = String(Float(first)! / Float(second)!)
                }
                
            }
            
        }else{
            alert(alert: "Harus Centang Lebih dari 1")
        }
    }
    func cekButton(sender: UIButton, cekBut: UIButton, textfield: UITextField){
        if sender.isSelected {
            sender.isSelected = false
            cekBut.isSelected = false
            if let index = selectedButton.firstIndex(of: textfield) {
                selectedButton.remove(at: index)
            }
        }else{
            selectedButton.append(textfield)
            sender.isSelected = true
            cekBut.isSelected = true
        }
    }
    func initialStart(){
        cek1But.isSelected = false
        cek2But.isSelected = false
        cek3But.isSelected = false
    }
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:    #selector(ViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    func alert(alert: String){
        let alert = UIAlertController(title: "Ada Alert", message: alert, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
}


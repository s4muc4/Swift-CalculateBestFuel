//
//  ViewController.swift
//  Best Fuel
//
//  Created by samuel.araujo on 13/09/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var resultBestOption: UILabel!
    @IBOutlet weak var alcoolField: UITextField!
    @IBOutlet weak var gasolinaField: UITextField!
    
    
    @IBAction func valuesReset(_ sender: Any) {
        resultBestOption.text = "Digite os preços"
        alcoolField.text = ""
        gasolinaField.text = ""
    }
    
    
    @IBAction func fuelCalculate(_ sender: Any) {
        
        
        if let precoAlcool = alcoolField.text {
            if let precoGasolina = gasolinaField.text {
                
                //Validar valores digitados
                let result = self.validadeField(precoAlcool: precoAlcool, precoGasolina: precoGasolina)
                
                //Se campos foram validados TRUE calcula combustivel
                if result{
                    resultBestOption.text = self.calculateBestPrice(precoAlcool: precoAlcool, precoGasolina: precoGasolina)
                }
                else{
                    resultBestOption.text = "Digite os preços para calcular!"
                }
            }
        }
    }
    
    func calculateBestPrice(precoAlcool: String, precoGasolina: String) -> String {
        
        var resultBest = ""
        
        //Converte valores texto para numeros
        if let valorAlcool = Double(precoAlcool.replacingOccurrences(of: ",", with: ".")){
            if let valorGasolina = Double(precoGasolina.replacingOccurrences(of: ",", with: ".")){
                
                let result = valorAlcool / valorGasolina
                
                if result >= 0.7 {
                    resultBest =  "A melhor opção é Gasolina"
                }
                else{
                    resultBest =  "A melhor opção é Álcool"
                }
            }
        }
        return resultBest
    }
        
    func validadeField(precoAlcool: String, precoGasolina: String) -> Bool {
        
        var validatedFields = true
       
        
        if precoAlcool.isEmpty{
            validatedFields = false
        }
        else if precoAlcool.isEmpty{
            validatedFields = false
        }
        
        
        
        return validatedFields
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
              
        //Looks for single or multiple taps.
         let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false

        view.addGestureRecognizer(tap)
    }

    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }


}


//
//  SettingsViewController.swift
//  ComprasUsa
//
//  Created by Bruno Vieira Souza on 12/10/21.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tfDolar: UITextField!
    @IBOutlet weak var tfIOF: UITextField!
    @IBOutlet weak var tfStateTaxas: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tfDolar.text = tc.getFormattedVallue(of: tc.dolar, withCurrency: "")
        tfIOF.text = tc.getFormattedVallue(of: tc.iof, withCurrency: "")
        tfStateTaxas.text = tc.getFormattedVallue(of: tc.stateTax, withCurrency: "")
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    

    func setValues() {
        tc.dolar = tc.converterToDouble(tfDolar.text!)
        tc.iof = tc.converterToDouble(tfIOF.text!)
        tc.stateTax = tc.converterToDouble(tfStateTaxas.text!)
    }


}


extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        setValues()
    }
    
}

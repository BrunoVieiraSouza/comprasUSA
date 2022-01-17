//
//  TaxasViewController.swift
//  ComprasUsa
//
//  Created by Bruno Vieira Souza on 12/10/21.
//

import UIKit

class TaxasViewController: UIViewController {
    
    @IBOutlet weak var lbDolar: UILabel!
    @IBOutlet weak var lbSStateTaxDescription: UILabel!
    @IBOutlet weak var lbStateTax: UILabel!
    @IBOutlet weak var lbIOFDescription: UILabel!
    @IBOutlet weak var lbIOF: UILabel!
    @IBOutlet weak var swCreditCard: UISwitch!
    @IBOutlet weak var lbTotalReal: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        calculateTaxas()
    
    }
    
    @IBAction func changeIOF(_ sender: UISwitch) {
        calculateTaxas()
        
        
    }
    
    
    func calculateTaxas() {
        lbSStateTaxDescription.text = "Imposto do Estado ( \(tc.getFormattedVallue(of: tc.stateTax, withCurrency: "")) %)"
        lbIOFDescription.text = "IOF ( \(tc.getFormattedVallue(of: tc.iof, withCurrency: "")) %)"
        lbDolar.text = tc.getFormattedVallue(of: tc.shoppingValue, withCurrency: "US$ ")
        lbStateTax.text = tc.getFormattedVallue(of: tc.stateTaxValue, withCurrency: "US$ ")
        lbIOF.text = tc.getFormattedVallue(of: tc.iofValue , withCurrency: "UU$")
        
        let real = tc.calculate(usingCreditCard: swCreditCard.isOn)
        
        lbTotalReal.text = tc.getFormattedVallue(of: real * tc.dolar, withCurrency: "R$")
        
        }
    
    
    
}

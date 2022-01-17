//
//  TaxesCalculator.swift
//  ComprasUsa
//
//  Created by Bruno Vieira Souza on 13/10/21.
//

import Foundation

class TaxesCalculator {
    
    static let shared = TaxesCalculator()
    
    var dolar: Double = 3.5
    var iof: Double = 6.38
    var stateTax: Double = 7.0
    var shoppingValue: Double = 0
    
    
    let formater = NumberFormatter()
    
    var shoppingValueinReal: Double {
        return shoppingValue * dolar
    }
    
    var stateTaxValue: Double {
        shoppingValue * stateTax/100
    }
    
    var iofValue: Double {
        return (shoppingValue + stateTax) * iof/100
    }
    
  
    
    func calculate(usingCreditCard: Bool) -> Double {
        var finalValue = shoppingValue + stateTaxValue
        if usingCreditCard {
            finalValue += iofValue
        }
        return finalValue
    }
    
    
    
    //funcao para converter os numeros. Ex: quando possuir virgula para converter Double || converter em moeda
    func converterToDouble(_ string: String) -> Double {
        formater.numberStyle = .none
        return formater.number(from: string)!.doubleValue
        
    }
    
    //funcao para me dar um valor formatado
    func getFormattedVallue(of value: Double, withCurrency currency: String) -> String {
        formater.numberStyle = .currency
        formater.currencySymbol = currency
        formater.alwaysShowsDecimalSeparator = true
        
        return formater.string(from: NSNumber(floatLiteral: value))!

    }
    
    
    
    // inicializador privado para outras classe nao poderem inicializar
    private init() {
        formater.usesGroupingSeparator = true
    }
    
    

    
}

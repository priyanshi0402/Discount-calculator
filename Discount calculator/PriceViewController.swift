//
//  PriceViewController.swift
//  Discount calculator
//
//  Created by SARVADHI on 10/05/23.
//

import UIKit

class PriceViewController: UIViewController {

    @IBOutlet weak var lblOldPrice: UILabel!
    @IBOutlet weak var lblSavingPrice: UILabel!
    @IBOutlet weak var lblPayPrice: UILabel!
    @IBOutlet weak var lblDiscount: CustomLabel!
    @IBOutlet weak var discountPrice: UITextField!
    @IBOutlet weak var txtOriginalPrice: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.tintColor = .blue
        self.title = "Calculate"
        self.lblDiscount.backgroundColor = UIColor(named: "ErrorColor")?.withAlphaComponent(0.10)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func discountAction(_ sender: Any) {
        self.lblOldPrice.text = txtOriginalPrice.text
        let price = (self.txtOriginalPrice.text)?.toDouble() ?? 0.0
        let discountPrice = (self.discountPrice.text)?.toDouble() ?? 0.0
        self.lblSavingPrice.text = (price-discountPrice).toStringD
        self.lblPayPrice.text = discountPrice.toStringD
        let perDiscount = (100) - ((discountPrice / (price)) * 100)
        self.lblDiscount.text = "- \(perDiscount.toString)%"
        
        self.lblOldPrice.attributedText = NSAttributedString(string: price.toStringD).strikethrough(strikeColor: UIColor(named: "ErrorColor") ?? .red)
    }
    

}

extension String {
    func toDouble() -> Double {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        let formattedValue = formatter.number(from: self)?.doubleValue ?? 0.0
        return formattedValue
        //        return NumberFormatter()..number(from: self)?.doubleValue ?? 0.0
    }
}

extension Double {
    var toInt: Int {
        return Int(self)
    }
    var toString: String {
        return self.toInt.toString
    }
    
    var toStringD: String {
        return String(self)
    }
}

extension Int {
    public var toString: String { return String(self) }
}

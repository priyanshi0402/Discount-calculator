//
//  DiscountViewController.swift
//  Discount calculator
//
//  Created by SARVADHI on 10/05/23.
//

import UIKit

class DiscountViewController: UIViewController {

    @IBOutlet weak var taxView: UIView!
    @IBOutlet weak var lblDiscount: CustomLabel!
    @IBOutlet weak var lblOriginalPrice: UILabel!
    @IBOutlet weak var lblSavePrice: UILabel!
    @IBOutlet weak var lblFinalPrice: UILabel!
    @IBOutlet weak var taxSwitch: UISwitch!
    @IBOutlet weak var txtSalesTax: UITextField!
    @IBOutlet weak var txtPrice: UITextField!
    @IBOutlet weak var txtOriginal: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.tintColor = .blue
        self.title = "Calculate"
        self.lblDiscount.backgroundColor = UIColor(named: "ErrorColor")?.withAlphaComponent(0.10)
        let price = (self.txtOriginal.text ?? "0.0").toDouble()
        self.lblOriginalPrice.attributedText = NSAttributedString(string: price.toStringD).strikethrough(strikeColor: UIColor(named: "ErrorColor") ?? .red)

        // Do any additional setup after loading the view.
    }
    

    @IBAction func calculateAction(_ sender: Any) {
        let price = (self.txtOriginal.text ?? "0.0").toDouble()
        let discount = (self.txtPrice.text ?? "0").toDouble()
        let taxIncluded = self.taxSwitch.isOn
        let savingPrice = (price*discount)/100
        let finalPrice = (price-savingPrice)
        self.lblSavePrice.text = savingPrice.toStringD
        self.lblFinalPrice.text = finalPrice.toStringD
        if !taxIncluded {
            let tax = (self.txtSalesTax.text ?? "0").toDouble()
            let taxPrice = (savingPrice*tax/100)
            let payPrice = (finalPrice*tax/100)
            self.lblSavePrice.text = (taxPrice+savingPrice).toStringD
            self.lblFinalPrice.text = (payPrice+finalPrice).toStringD
        }
        self.lblOriginalPrice.attributedText = NSAttributedString(string: price.toStringD).strikethrough(strikeColor: UIColor(named: "ErrorColor") ?? .red)
        self.lblDiscount.text = "- \(discount.toString)%"
        
    }
    
    @IBAction func priceIncludedSwitchAction(_ sender: UISwitch) {
        self.taxView.isHidden = sender.isOn
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension NSAttributedString {
    public func strikethrough(strikeColor: UIColor) -> NSAttributedString {
        guard let copy = self.mutableCopy() as? NSMutableAttributedString else { return self }

        let range = (self.string as NSString).range(of: self.string)
        let attributes = [
            NSAttributedString.Key.strikethroughStyle: NSNumber(value: NSUnderlineStyle.single.rawValue as Int),
            NSAttributedString.Key.strikethroughColor: strikeColor]
        copy.addAttributes(attributes, range: range)

        return copy
    }
}

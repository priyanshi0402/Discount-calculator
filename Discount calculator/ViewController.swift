//
//  ViewController.swift
//  Discount calculator
//
//  Created by SARVADHI on 09/05/23.
//

import UIKit
import StoreKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true 
    }

    @IBAction func priceAction(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DiscountViewController") as! DiscountViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func discountAction(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PriceViewController") as! PriceViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func aboutAsAction(_ sender: Any) {
        self.showAlert(vc: self, title: "About Us!", message: "Welcome to our discount calculator app, where we help you effortlessly calculate discounts and savings. Our mission is to simplify the process of determining discounts and final prices, making it easier for shoppers, bargain hunters, and budget-conscious individuals. With our user-friendly interface, you can quickly input the original price, discount percentage, or amount, and instantly calculate the discounted price and savings. Our app is perfect for anyone looking to maximize their savings, compare prices, or make informed purchase decisions. Join our community of savvy shoppers who rely on our discount calculator app, and unlock a world of smart shopping possibilities today!")
    }
    
    @IBAction func shareAction(_ sender: Any) {
        self.ShareMyApp()
    }
    
    @IBAction func ratusAction(_ sender: Any) {
        self.rateApp()
    }
    
    func rateApp() {
        if #available(iOS 10.3, *) {
            SKStoreReviewController.requestReview()
        } else if let url = URL(string: "itms-apps://itunes.apple.com/app/" + "6447046704") {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    func ShareMyApp() {
        let activityItems : NSArray = ["itms-apps://itunes.apple.com/us/app/apple-store/id6447046704?mt=8"]
        let activityVC : UIActivityViewController = UIActivityViewController(activityItems: activityItems as! [Any], applicationActivities: nil)
        present(activityVC, animated: true, completion: nil)
    }
    
    func showAlert(vc: UIViewController, title: String, message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            vc.present(alert, animated: true, completion: nil)
        }
    }
}


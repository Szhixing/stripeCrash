//
//  ViewController.swift
//  Stripe
//
//  Created by admin on 2024/6/4.
//

import UIKit
import StripePaymentSheet

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .orange
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
                
        StripeAPI.defaultPublishableKey = PublishableKey
        
        var config = PaymentSheet.Configuration()
        config.applePay = .init(merchantId: merchantId, merchantCountryCode: "US")
        
        config.returnURL = returnURL
        PaymentSheet(paymentIntentClientSecret: ClientSecret, configuration: config).present(from: self) { paymentResult in
         
            switch paymentResult {
            case .completed:
                print("支付成功")
            default:
                break
            }
        }
    }
}


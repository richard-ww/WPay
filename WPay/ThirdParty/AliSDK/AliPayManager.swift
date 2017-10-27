//
//  AliPayManager.swift
//  WPay
//
//  Created by WeiWei on 2017/10/10.
//  Copyright © 2017年 iLabs, Inc. All rights reserved.
//

import UIKit

let appID = "2017092308881494"
let rsa2PrivateKey = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDRcKmFRpc8lWaNcbzRC836DEUE5AfK+OnzGlMXxICtH9KoMy+o4TAx0IruJ6vzO4hqRUSIRURCXzo+kwty+9UFRV+PXgEoA8Aq3PRl9fv35E0f69V63YLyVBH5gApvulyGUyZawiXV7glkNKDNBAK9lrLMZg3oaJT092mW+6mDcNkShm8YDtpjPaDv71RQozAlVZwxOqH2vCnwbTogrbWlZ7GzxkdXdbaR6npND2xTZjmRP1G/ElC02uthGCbIGkBe/9jlBblm9r9P6UYJJ6kBKDQbZZN7L2TCju4DbQUtir2vsz8vDEMlust17fHh+e8235gX9aD76TeoQ5oI32wHAgMBAAECggEALip1U4lh4NrVxiviAPpnJsz5kcBp71W6y/lrg3uvGXpARw8xXDp3EyPy29gm0PC4eyRVnOwXxcGT5yMmjOvx4r2N+N4xxw48l7YosSjtp5DNZ1HmtrSJHr1lUOfmZQZhSsKdW7gb+vIDY/Et2MMfj4beVqvQOQCEhRLcVYmXrf8V4zUCLbkCYOkS+pTfzPkT8+Ac+bo/8f3lJmXTrtz54ohhExSR0ab6xZlMzgf0rBbHLiTIbXwf25PaWiUHbKNvaUPsEadIro8t3ZLEaRZkY51uQYVDa6Vh9IC5JCWTtnl+MI7umOMiMYLJd9dBygaRMdyZDSV3A42rChdgj6RUUQKBgQDqiJVpUHAHU5o+VPgH6EOti8Hi5h57OOS5je6LN6lKbfKZsynobucUfRrQwy+MF+MIMLHt7jFv1C0K3sY9abCgVm09xvRjRdlNPcSsYdv8MO0Kv2rjb77ohbfVeuqkFdOgwlu2XHuDpLofpcDDlVamwngEYtMUMauxoVVURPWMIwKBgQDknBuHYSK0HxC6DDT2G7su3kNcZuAC8MZoDPSHD5EclCt8qw8wHuBI5etxIFBSbUiDaOrXWmucg8Eoq3Gs8gzWEhVCGAS/m8iNvO2qNSg04FxNbDhpW0bY/gY9jhixVUruY/KS/2edpSLtMXPuKVS4n0IQFEnaSMr2obM2ymI8zQKBgQDClcuQ8wHfskdYy9p1hQkRpdCZVl+X0J5ELTPrIaU9cXdEelec1ta2Mw3agvah/veIRg5535P4ukscp7RGI7g9bzd3d+gvrTYbVdIlS5Pe6yDgN+yRApecB8V8Q10GAm3xBRBefuCjWjpqI3WJUA/yj4pP6UZDjOpsl/RZ1FT9jQKBgHm7ruUOEn67tBp9+Y28ApbYgCIqHcszD1PE4kkxPuJq/CUsqa/EIUZwOElLHbpmuyBOtA7s9TSo7CiN8sBXPAKaKnvBcnXdrJPdMOlb2QcfGceYgwmHM1jFG+mXSwrTEk2TJ06jdjd6AfkwRj1iAN024OTTCOiVro5aWKYqatlZAoGAXKpIrNiq06Bfb3pDXNtYUu74QUi0Eafp4WCgiNYuO5KogJmfc+LRFlqxq8LdmtMvZwuNdmjdijPSqqGB4Z/bc3W6ehrJM2fHdprXjp6rLuOZ/06nK/us4N5f5457h14zA3rAOj8adwc/W9SqsOkqEZO1jWyry23dCjNqxiSlguc="


class AliPayManager: NSObject {
    
    class func createOrder(userId: String,amount: String, remark: String) {
        
        // 生成快捷订单
        let order = Order()
        order.app_id = appID
        order.method = "alipay.trade.app.pay"
        order.charset = "utf-8"
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        order.timestamp = formatter.string(from: Date())
        order.version = "1.0"
        order.sign_type = "RSA2"
        order.notify_url = "notify_url"
        
        // NOTE: 商品数据
        order.biz_content = BizContent()
        order.biz_content.body = remark
        order.biz_content.subject = remark
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMddHHmmss"
        let tardeNo = 10000 + Int(arc4random()%1000)+1
        order.biz_content.out_trade_no = dateFormatter.string(from: Date()) + String(tardeNo)
        
        order.biz_content.timeout_express = "30m"
        order.biz_content.total_amount = amount
        
        // 将商品信息拼接成字符串
        let orderInfo           = order.orderInfoEncoded(false) ?? ""
        let orderInfoEncoded    = order.orderInfoEncoded(true) ?? ""
        print("orderSpec = %@",orderInfo)
        
        // NOTE: 获取私钥并将商户信息签名，外部商户的加签过程请务必放在服务端，防止公私钥数据泄露；
        // 需要遵循RSA签名规范，并将签名字符串base64编码和UrlEncode
        var signedString = String()
        let signer = RSADataSigner(privateKey: rsa2PrivateKey)
        signedString = signer?.sign(orderInfo, withRSA2: true) ?? ""
        
        if signedString.characters.count > 0 {
            
            let appScheme = "WPay"
            let orderString = orderInfoEncoded + "&sign=" + signedString
            
            AlipaySDK.defaultService().payOrder(orderString, fromScheme: appScheme, callback: { (resultDic) in
                
                for (key,value) in resultDic! {
                    
                    print(key," == ",value)
                    
                    if key as! String == "resultStatus" {
                        if value as! String == "9000" {
                            
                            print("支付成功！")
                            return
                        }
                    }
                    if key as! String == "memo" {
                        
                        if (value as! String).characters.count > 0 {
                            
                            print("支付失败，原因：",value)
                        }
                    }
                }
            })
        }
    }
}

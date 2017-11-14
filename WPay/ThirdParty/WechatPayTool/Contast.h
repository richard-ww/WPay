//
//  Contast.h
//  WPay
//
//  Created by WeiWei on 2017/11/13.
//  Copyright © 2017年 --. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contast : NSObject

//微信支付商户号
#define MCH_ID  @"YOUR_MCH_ID"
//开户邮件中的（公众账号APPID或者应用APPID）
#define WX_AppID @"YOUR_WX_AppID"
//安全校验码（MD5）密钥，商户平台登录账户和密码登录http://pay.weixin.qq.com 平台设置的“API密钥”，为了安全，请设置为以数字和字母组成的32字符串。
#define WX_PartnerKey @"YOUR_WX_PartnerKey"
//获取用户openid，可使用APPID对应的公众平台登录http://mp.weixin.qq.com 的开发者中心获取AppSecret。
#define WX_AppSecret @"YOUR_WX_AppSecret"

@end

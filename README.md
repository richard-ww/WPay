# WPay

### IAP — In-App Purchase
官方文档 https://developer.apple.com/in-app-purchase/

步骤：
1. 填写银行信息
2. 新建产品价格
3. app 调用

核心框架 StroeKit
内购支付两个阶段：
1. app直接向苹果服务器请求商品，支付阶段；
2. 苹果服务器返回凭证，app向公司服务器发送验证，公司再向苹果服务器验证阶段；

### AliPay - 移动支付

官方文档 https://docs.open.alipay.com/59/103675/

客户端demo：https://docs.open.alipay.com/54/104509/

主要流程：
1. 生成order 完善order信息
2. 数据加签（推荐服务端处理）
3. 开始支付 并返回支付结果

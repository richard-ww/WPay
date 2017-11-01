//
//  DesignerProductDetailVC.swift
//  WPay
//
//  Created by WeiWei on 2017/11/1.
//  Copyright © 2017年 --. All rights reserved.
//

import UIKit

class DesignerProductDetailVC: UIViewController, UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    let dataArr = Array<String>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        
        self.initSubviews()
    }
    
    func initSubviews() {
        
        self.tableView.estimatedRowHeight = 200
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.separatorStyle = .none
        
        self.tableView.register(R.nib.autoImageCell(), forCellReuseIdentifier: R.nib.autoImageCell.identifier)
        self.tableView.register(R.nib.autoTextCell(), forCellReuseIdentifier: R.nib.autoTextCell.identifier)
        
    }
}

extension DesignerProductDetailVC {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        return self.dataArr.count
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard indexPath.row != 0 else {
            
            let title = "20世纪40年代以来，人们就梦想能拥有一个世界性的信息库。在这个信息库中，信息不仅能被全球的人们存取，而且能轻松地链接到其他地方的信息，使用户可以方便快捷地获得重要的信息。万维网中至关重要的概念超文本起源于1960年代的几个从前的项目。譬如泰德·尼尔森（Ted Nelson）的仙那都项目（Project Xanadu）和道格拉斯·英格巴特（Douglas Engelbart）的NLS。而这两个项目的灵感都是来源于万尼瓦尔·布什在其1945年的论文《和我们想得一样》中为微缩胶片设计的“记忆延伸”（memex）系统。蒂姆·伯纳斯·李的另一个才华横溢的突破是将超文本嫁接到因特网上。在他的书《编织网络》中，他解释说他曾一再向这两种技术的使用者们建议它们的结合是可行的，但是却没有任何人响应他的建议，他最后只好自己解决了这个计划。他发明了一个全球网络资源唯一认证的系统：统一资源标识符。最早的网络构想可以追溯到遥远的1980年蒂姆·伯纳斯·李构建的ENQUIRE项目。这是一个类似维基百科的超文本在线编辑数据库。尽管这与我们使用的万维网大不相同，但是它们有许多相同的核心思想，甚至还包括一些伯纳斯·李的万维网之后的下一个项目语义网中的构想。"
            
            let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.autoTextCell.identifier) as! AutoTextCell
            cell.setViewWithTitle(title: title)
            
            return cell
            
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.autoImageCell.identifier)!
        return cell
    }
}

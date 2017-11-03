//
//  PagingMenuOptions.swift
//  66FM
//
//  Created by PandaApe on 12/07/2017.
//  Copyright © 2017 RJS. All rights reserved.
//

import Foundation
import UIKit

struct PagingMenuOptions: PagingMenuControllerCustomizable {
    
    var viewControllers = [UIViewController]()
    var menuTitles      = [String]()
    
    var componentType: ComponentType {
        
        var menuOptions         = MenuOptions()
        menuOptions.menuTitles  = menuTitles
        
        return .all(menuOptions: menuOptions, pagingControllers: pagingControllers)
    }
    
    fileprivate var pagingControllers: [UIViewController] {
        return viewControllers
    }
    
    fileprivate struct MenuOptions: MenuViewCustomizable {
        
        var menuTitles = [String]()
        
        var displayMode: MenuDisplayMode {
            return .segmentedControl
        }
        
        var itemsOptions: [MenuItemViewCustomizable] {
            
            var menuItems = [MenuItem]()
            
            for item in menuTitles {
                
                var menuItem = MenuItem()
                menuItem.text = item
                
                menuItems.append(menuItem)
            }
            
            return menuItems
        }
        
        var focusMode: MenuFocusMode {
            return .underline(height: 2, color: MainGolden, horizontalPadding: 0, verticalPadding: 0)
        }
        
    }
    
    fileprivate struct MenuItem: MenuItemViewCustomizable {
        
        var text = ""
        
        var displayMode: MenuItemDisplayMode {
            
            let menuItemText = MenuItemText(text:  text, color: UIColor(white:102/255, alpha: 1), selectedColor: MainGolden, font: UIFont.systemFont(ofSize: 15), selectedFont: UIFont.systemFont(ofSize: 15))
            return .text(title: menuItemText)
        }
        
    }
    
}




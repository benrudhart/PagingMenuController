//
//  ViewController.swift
//  PagingMenuControllerDemo
//
//  Created by Yusuke Kita on 5/10/15.
//  Copyright (c) 2015 kitasuke. All rights reserved.
//

import UIKit
import PagingMenuController

class LogVC: UIViewController {
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        print(title!, " Will A")
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        print(title!, " Did A")
    }

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)

        print(title!, " Will D")
    }

    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)

        print(title!, " Did D ")
    }
}

class ViewController: UIViewController, PagingMenuControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let usersViewController = LogVC()
        let repositoriesViewController = LogVC()
        let gistsViewController = LogVC()
        let organizationsViewController = LogVC()

        usersViewController.view.backgroundColor = .redColor()
        usersViewController.title = "red"
        repositoriesViewController.view.backgroundColor = .blueColor()
        repositoriesViewController.title = "blue"
        gistsViewController.view.backgroundColor = .greenColor()
        gistsViewController.title = "green"
        organizationsViewController.view.backgroundColor = .yellowColor()
        organizationsViewController.title = "yellow"

        let viewControllers = [usersViewController, repositoriesViewController, gistsViewController, organizationsViewController]
        
        let options = PagingMenuOptions()


        options.backgroundColor = .darkGrayColor()
        options.selectedBackgroundColor = .darkGrayColor()
        options.selectedTextColor = .whiteColor()

        options.menuHeight = 44
        options.menuItemMode = .RoundRect(radius: 3, horizontalPadding: 8, verticalPadding: 10, selectedColor: UIColor(red:0.094, green:0.102, blue:0.122, alpha:1))
        options.selectedFont = UIFont.boldSystemFontOfSize(15)
        options.menuDisplayMode = .Infinite(widthMode: .Fixed(width: 90))


        
        let pagingMenuController = self.childViewControllers.first as! PagingMenuController
        pagingMenuController.delegate = self
        pagingMenuController.rebuild(viewControllers, options:options)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - PagingMenuControllerDelegate
    
    func willMoveToMenuPage(page: Int) {
    }
    
    func didMoveToMenuPage(page: Int) {
    }
}


//
//  ViewController.swift
//  cookieTryClient
//
//  Created by 游宗諭 on 2019/7/30.
//  Copyright © 2019 arise. All rights reserved.
//

import UIKit
import SafariServices


/** 流程:
 1. SafariViewContoller 訪問 URL
 2. 設定 info.plist::URL types::URL Schemes:: ytyuboxcookietry
 3. URL redirect 至 app scheme "ytyuboxcookietry://" + _COOKIE_
 4. func application(_ app:, open url:, options:) 中的 URL 可拿到 step 3. 的 URL
*/
class ViewController: UIViewController {

    @IBOutlet weak var coverView: UIView!
    lazy var sfVC:SFSafariViewController? = SFSafariViewController(url: URL(string: "http://localhost:8080/redirect")!)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sfVC?.delegate = self
        guard let sfVC = sfVC else { return }
        addChild(sfVC)
        sfVC.didMove(toParent: self)
        sfVC.view.frame = .init(x: 0, y: 0, width: 100, height: 100)
        view.addSubview(sfVC.view)
        view.bringSubviewToFront(coverView)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = .black
    }

}


extension ViewController: SFSafariViewControllerDelegate{
    func safariViewController(_ controller: SFSafariViewController, didCompleteInitialLoad didLoadSuccessfully: Bool) {
        sfVC?.view.removeFromSuperview()
        sfVC?.removeFromParent()
        sfVC?.dismiss(animated: false, completion: nil)
        sfVC = nil
    }
}

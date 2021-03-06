//
//  MyMessagesViewController.swift
//  SchoolPlus
//
//  Created by 金含霖 on 2020/9/2.
//  Copyright © 2020 金含霖. All rights reserved.
//

import UIKit
import ProgressHUD

class MyMessagesViewController: BaseMessageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func getData(_ controller: BaseMessageViewController) -> [Infomation] {
        model.getMyData().subscribe(onNext:{ [weak self]list in
            self?.messages = list
            self?.model.pageNum += 1
            },onError: { error in
                ProgressHUD.showError(error.localizedDescription)
            }).disposed(by: disposeBag)
        return messages
    }

   

}

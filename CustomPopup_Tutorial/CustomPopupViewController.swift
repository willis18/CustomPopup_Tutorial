//
//  CustomPopupViewController.swift
//  CustomPopup_Tutorial
//
//  Created by 김송현 on 2021/03/15.
//

import UIKit

class CustomPopupViewController : UIViewController{
    
    @IBOutlet var contentView: UIView!
    @IBOutlet var subscribeBtn: UIButton!
    @IBOutlet var bgBtn: UIButton!
    @IBOutlet var openChatBtn: UIButton!
    var subscribeBtnCompletionClosuer: (()->Void)?
    var myPopupDelegate : PopupDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.layer.cornerRadius = 30
        subscribeBtn.layer.cornerRadius = 10
        openChatBtn.layer.cornerRadius = 10
        
    }
    @IBAction func onBgBtnClicked(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func onSubscribeBtnClicked(_ sender: UIButton) {
        print("컴플레션 블록 홏")
        self.dismiss(animated: true, completion: nil)
        //컴플레션 블록 호출
        if let subscribeBtnCompletionClosuer = subscribeBtnCompletionClosuer{
            //메인에 알림
            subscribeBtnCompletionClosuer()
        }
    }
    @IBAction func onOpenChatBtnClicked(_ sender: UIButton) {
        myPopupDelegate?.onOpenChatBtnClicked() 
        self.dismiss(animated: true, completion: nil)
    }
}

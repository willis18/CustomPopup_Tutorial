//
//  ViewController.swift
//  CustomPopup_Tutorial
//
//  Created by 김송현 on 2021/03/12.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet var createPopupBtn: UIButton!
    @IBOutlet var myWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onCreatePopupBtnClicked(_ sender: UIButton) {
        //스토리보드 가져오기
        let storyboard = UIStoryboard.init(name: "Popup", bundle: nil)
        //스토리보드를 통해 뷰컨트롤러 가져오기
        let customPopupVC = storyboard.instantiateViewController(withIdentifier: "AlertPopupVC") as! CustomPopupViewController
        //뷰컨트롤러 보여지는 스타일
        customPopupVC.modalPresentationStyle = .overCurrentContext
        //뷰컨트롤러 사라지는 스타일
        customPopupVC.modalTransitionStyle = .crossDissolve
        
        customPopupVC.subscribeBtnCompletionClosuer = {
            let myChannelUrl = URL(string: "https://www.youtube.com/watch?v=RSGfF0qMf4o&list=PLgOlaPUIbynqRzpQBIdEDnjDdkVsjHqxK&index=19")
            print("웹로딩 거침")
            self.myWebView.load(URLRequest(url: myChannelUrl! ))
        }
        
        self.present(customPopupVC, animated: true, completion: nil)
    }
    
}


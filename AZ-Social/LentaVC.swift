//
//  LentaVC.swift
//  AZ-Social
//
//  Created by  Denis Ovchar on 08.03.17.
//  Copyright © 2017  Denis Ovchar. All rights reserved.
//

import Foundation
import  UIKit

class LentaVC:UIViewController,UITableViewDataSource,UITableViewDelegate,LoaderDelegate
{
    var postsStorage = WallPostStorage()
    var isLoadingNewInTable = false
    var postsLoader:WallPostLoaderFromServer!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var tableViewBottomConstraint: NSLayoutConstraint!
    
     override func loadView() {
        super.loadView()
        
        
        
        
        
        postsLoader = WallPostLoaderFromServer(named: "newsServerLoader", with: ServerManager.shared(named: "main")!, qos: .userInteractive)
        postsLoader.delegate = self
        postsStorage.assignLoader(named: "postsFromServer", loader: postsLoader)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "WallPostCellTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "wallPostCell")
        
        tableView.register(UINib(nibName: "AddPostCell", bundle: Bundle.main), forCellReuseIdentifier: "addPostCell")

        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardNotification(notification:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
        
       // NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(notification:)), name:NSNotification.Name.UIKeyboardWillShow, object: nil);
       // NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(notification:)), name:NSNotification.Name.UIKeyboardWillHide, object: nil);
        
    }
   
    func keyboardNotification(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            let endFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
            let beginFrame = (userInfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
            let duration:TimeInterval = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
            let animationCurveRawNSN = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? NSNumber
            let animationCurveRaw = animationCurveRawNSN?.uintValue ?? UIViewAnimationOptions.curveEaseInOut.rawValue
            let animationCurve:UIViewAnimationOptions = UIViewAnimationOptions(rawValue: animationCurveRaw)
           /* if (endFrame?.origin.y)! >= UIScreen.main.bounds.size.height {
                self.tableViewBottomConstraint?.constant = 0.0
            } else {
                self.tableViewBottomConstraint?.constant = 200
                    //(endFrame?.minY)!-(beginFrame?.minY)!
            }*/
            
            self.tableViewBottomConstraint?.constant =  view.frame.height - (tabBarController?.tabBar.frame.height)! - (endFrame?.minY)!
            UIView.animate(withDuration: duration,
                           delay: 0,
                           options: animationCurve,
                           animations: {
                            
                            self.view.layoutIfNeeded()
                            print(duration)
                            print((endFrame?.minY))
                            print(animationCurve)
                            
                            
                            
                            
                            // self.tableView.frame=CGRect(x: 0, y: 0, width: Ss.X, height: (endFrame?.minY)!-150)
                            //self.container.center.y=(endFrame?.minY)!-150+19
                            
                            //  self.keyboardHeight = (endFrame?.minY)!-(beginFrame?.minY)!
                            
                            // self.moveContainer(y: (endFrame?.minY)!-(beginFrame?.minY)!)
            },
                           completion: nil)
            
            
        }
    }

    @IBAction func didTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if (indexPath.section ==  postsStorage.count-10) {
            print("schould load more")
            postsLoader.loadMoreToTheEnd(count: 10)
        }
        
        if (indexPath.section == 0)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "addPostCell") as! AddPostCell
            cell.tableView = tableView
            return cell

        }
        else
        {
           let cell = tableView.dequeueReusableCell(withIdentifier: "wallPostCell") as! postCell
            cell.post = postsStorage[indexPath.row] as! WallPost
            return cell

        }
        
    }
 
    func numberOfSections(in tableView: UITableView) -> Int {
        return postsStorage.count + 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        
    }
    
    func didLoadEntitiesToTheEnd(Amount: Int) {
        
    }
    func didLoadEntitiesToTheStart(Amount: Int) {
        
    }
    
    func didReloadEntities(indexes:[Int])
    {}
    func didDeleteEntities(indexes:[Int])
    {}
    func didAddEntities(indexes:[Int])
    {}
    
}

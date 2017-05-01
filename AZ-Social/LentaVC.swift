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
    
    
     override func loadView() {
        super.loadView()
        
        
        postsLoader = WallPostLoaderFromServer(named: "newsServerLoader", with: ServerManager.shared(named: "main")!, qos: .userInteractive)
        postsLoader.delegate = self
        postsStorage.assignLoader(named: "postsFromServer", loader: postsLoader)
        
        
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "wallPostCell") as! postCell
        cell.post = postsStorage[indexPath.row] as! WallPost

        
        
        if (indexPath.section ==  postsStorage.count-10) {
            print("schould load more")
            postsLoader.loadMoreToTheEnd(count: 10)
        }
        
        return UITableViewCell()
    }
 
    func numberOfSections(in tableView: UITableView) -> Int {
        return postsStorage.count
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

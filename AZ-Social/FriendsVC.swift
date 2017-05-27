//
//  FriendsVC.swift
//  AZ-Social
//
//  Created by  Denis Ovchar on 08.03.17.
//  Copyright © 2017  Denis Ovchar. All rights reserved.
//

import UIKit
import Foundation
class FriendsVC:UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,UISearchControllerDelegate, UISearchResultsUpdating
{
  
    @IBOutlet weak var tableView: UITableView!
    var alphabet:[String] = ["Частые","A"]

    var alphabetFiltered:[String] = ["","Глобальный поиск"]
    var data = (UIApplication.shared.delegate as! AppDelegate).data
    var searchController = UISearchController()
    var searchBar:UISearchBar!
    var searchActive : Bool = false
    //var filtered:[String] = []
    var friends=[String:[Person]]()
    var fiveFriends=[Person]()
    var friendsFiltered=[String:[Person]]()
    var mode:Int = 0
    var isOpened = false
    
    var menuBut = UIButton()
    var infoBut = UIButton()
    let spinner = UIActivityIndicatorView()
    var hasLoaded = true
    //var latBigRange:NSRange = "A". ..."Z"
    override func loadView() {
        super.loadView()
        friends["Частые"] = [Person]()
        friends["Частые"]?.append(Person(name: "Стив", secondName: "Джобс", pictUrl: "https://st.kp.yandex.net/images/actor_iphone/iphone360_93826.jpg", isOnline: true, id: 3))
        friends["A"] = [Person]()

        for i in 0...10
        {
            let fr = Person(name: "Стив", secondName: "Джобс", pictUrl: "https://st.kp.yandex.net/images/actor_iphone/iphone360_93826.jpg", isOnline: true, id: i)
            friends["A"]?.append(fr)
            fiveFriends.append(fr)
            for j in 0...25
            {
                if j % 2 == 0
                {
                    
                    //fr.chat.messages.append( Message(sender: fr, isMine: false, text: "привет \(i) fdg\(j) dfg dfgdfg dsfg dfg sdfg sdfg sdfg sdfgsd fgs dfgsdf sfgd", isRead : true,time: "11:41"))
                }
                else
                {
                  //  fr.chat.messages.append( Message(sender: data.myProfile, isMine: true, text: "привет \(i)", isRead : true,time: "11:40"))
                }
                
            }
        }
        
        navigationItem.title = "Друзья"
        self.edgesForExtendedLayout = UIRectEdge.all
        self.searchController = UISearchController(searchResultsController:  nil)
        
        self.searchController.searchResultsUpdater = self
        self.searchController.delegate = self
        self.searchController.searchBar.delegate = self
        
       // self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.dimsBackgroundDuringPresentation = true
        
        //self.navigationItem.titleView = searchController.searchBar
        
        self.definesPresentationContext = true
        
        let screenSize: CGRect = UIScreen.main.bounds
        Ss.X=screenSize.width
        Ss.Y=screenSize.height
        Ss.statusBar=UIApplication.shared.statusBarFrame.height
        Ss.Yy=Ss.Y - (navigationController?.navigationBar.frame.height)! - Ss.statusBar
        //-(tabBarController?.tabBar.frame.height)!
        
        
      /*
        menuBut.frame=CGRect(x: 0, y: 0, width: 25, height: 25)
        menuBut.setImage(UIImage(named: "list_view_1x") , for: UIControlState.normal)
        
        
        menuBut.addTarget(self,
                          action: #selector(DictionaryViewController.menu(_:)),
                          for: UIControlEvents.touchUpInside)
        
        
        
        infoBut.frame=CGRect(x: 0, y: 0, width: 25, height: 25)
        infoBut.setImage(UIImage(named: "info_1x") , for: UIControlState.normal)
        
        
        infoBut.addTarget(self,
                          action: #selector(DictionaryViewController.info(_:)),
                          for: UIControlEvents.touchUpInside)
        */
        // data.menu=menutable(data: data)
        
        
        searchBar = searchController.searchBar
        searchBar.delegate = self
        searchBar.placeholder="Поиск"
        searchBar.backgroundColor = UIColor(netHex: 0x00bed4)
        searchBar.barTintColor = UIColor(netHex: 0x00bed4)
        tabBarController?.tabBar.tintColor = UIColor(netHex: 0x00bed4)
       // tableView.tableHeaderView = searchBar
        
        
      //  tableView.register(CustomCell.self, forCellReuseIdentifier: "glosCell")
      /*
        tableView.sectionIndexColor = UIColor(netHex: 0x00bed4)
        tableView.backgroundColor = UIColor(netHex: 0xedf1f2)
        //     tableView.sectionIndexBackgroundColor
        UITableViewHeaderFooterView.appearance().tintColor = UIColor(netHex: 0xedf1f2)
        tableView.tintColor = UIColor(netHex: 0xedf1f2)
 */
        if tableView != nil{
            tableView.delegate=self
            tableView.dataSource=self
            tableView.rowHeight = 70
            setLoadingScreen()
            
            
            
            
            
            
            
            self.removeLoadingScreen()
            
            
            self.hasLoaded=true
        }
       

 
        
        
    
        
       
           // self.tableView.reloadData()
            
            for family: String in UIFont.familyNames
            {
                print("\(family)")
                for names: String in UIFont.fontNames(forFamilyName: family)
                {
                    print("== \(names)")
                }
            }
            
            
   /*         for s in self.data.alphabet
            {
                print(s)
            }
         */
        }
        
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //navigationController?.hidesBarsOnSwipe = true
        
        navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: navigationController!.navigationBar.frame.width , height: 88)
      //  navigationController?.navigationBar.barTintColor = UIColor.green
        
       /* UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.beginFromCurrentState
            , animations: {
                self.navigationController?.navigationBar.barTintColor = UIColor(netHex: 0x00bed4)
                
                self.navigationController?.navigationBar.barStyle = .black
                self.navigationController?.navigationBar.tintColor = UIColor.white
                
        }, completion: { finished in
        })
        */
    }
    /*override func viewWillDisappear(_ animated: Bool) {
       // navigationController?.hidesBarsOnSwipe = true
        
        navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: navigationController!.navigationBar.frame.width , height: 64)
       // navigationController?.navigationBar.barTintColor = UIColor.green
    }*/
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: navigationController!.navigationBar.frame.width , height: 64)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        
        if (self.searchActive)
        {
            
        }
        else
        {
            if indexPath.section == 0
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "fiveFriendCell", for: indexPath) as! fiveFriendstableCell
                cell.setcell(friends: fiveFriends)
                return cell
            }
            else
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as! cellFriend
                cell.setcell(friend: friends[alphabet[indexPath.section]]![indexPath.row])
                
                return cell
            }
        }
   
        
        return UITableViewCell()
        
        
        
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if searchActive{
            return String(alphabetFiltered[section])
        }
        else
        {
            return String(alphabet[section])
            
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        if searchActive{
            return 2
            
        }
        else
        {
            return alphabet.count
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !hasLoaded
        {
            return 0
        }
        if (searchActive)
        {
            
            return (friendsFiltered[alphabetFiltered[section]]?.count)!
            
        }
        else
        {
            return (friends[alphabet[section]]?.count)!
            
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0
        {
            return 91
        }
        else
        {
            return 70
        }
    }
    func  tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        isOpened = true
        
        
        tableView.deselectRow(at: tableView.indexPathForSelectedRow!, animated: true)
        
        // tableView.scrollToRow(at: indexPath, at: UITableViewScrollPosition.top, animated: false)
    
        // tableView.indexPathForSelectedRow
        // tableView.allowsSelection = false
        
    }
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        if (searchActive)
        {
            return alphabetFiltered
        }
        else
        {
            return alphabet
        }
    }
    /*   func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
     
     }*/
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        // searchActive = true;
        
        searchBar.setShowsCancelButton(true, animated: true)
        //closeBut.isHidden = false
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        // searchActive = false;
        //searchBar.cancel
        
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
        searchBar.setShowsCancelButton(false, animated: true)
        DispatchQueue.main.async(){
            
            self.tableView.reloadData()
        }
        searchBar.resignFirstResponder()
        
        searchBar.text = ""
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        /*filtered = data.filter({ (text) -> Bool in
         let tmp: NSString = text
         let range = tmp.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
         return range.location != NSNotFound
         })*/
        /*
        DispatchQueue.main.async(){
            if searchText.characters.count != 0 {
                self.alphabetFiltered = [String]()
                //searchText = searchText.lowercased()
                var cnt = 0
                for firstCharString in self.alphabet
                {
                    
                    self.friendsFiltered[firstCharString]=self.friends[firstCharString]?.filter({ (term) -> Bool in
                        
                        
                        let tmp: NSString = ((term as Term).name as NSString)
                        let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
                        return range.location != NSNotFound
                    })
                    if (self.friendsFiltered[firstCharString] != nil)
                    {
                        cnt+=(self.friendsFiltered[firstCharString]?.count)!
                        if((self.friendsFiltered[firstCharString]?.count)! != 0)
                        {
                            
                            self.alphabetFiltered.append(firstCharString)
                        }
                    }
                }
                print("ищу там\(cnt)")
                self.searchActive = true
                
                self.tableView.reloadData()
                
            }
            else
            {
                self.searchActive = false
                
                self.tableView.reloadData()
            }
            if self.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) != nil{
                self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: UITableViewScrollPosition.top, animated: true)
                
            }
        }
        
        
        */
        
        
    }
    @IBAction func back(_ sender: AnyObject) {
        //performSegue(withIdentifier: "StartToReminders", sender: self)
        
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if(searchBar.isFirstResponder)
        {
            searchBar.resignFirstResponder()
            searchBar.setShowsCancelButton(false, animated: true)
            
        }
        
    }
    @IBAction func menu(_ sender: AnyObject) {
        //performSegue(withIdentifier: "StartToReminders", sender: self)
        
        isOpened = false
        
        let path = tableView.indexPathsForVisibleRows?[0]
        
        //for path in
        //    UITableViewScrollPosition.middle, animated: false)
        
        /*  for cell  in self.tableView.visibleCells as! [CustomCell]
         {
         cell.closeCell()
         //cell.layoutSubviews()
         }*/
        //   let indpaths = self.tableView.indexPathsForVisibleRows.
        /* let range = NSMakeRange(0, self.tableView.numberOfSections)
         let sections = NSIndexSet(indexesIn: range)
         self.tableView.reloadSections(sections as IndexSet, with: .automatic)*/
        
        
        
        
        
        
        
     //   self.tableView.reloadData()
    
        self.tableView.scrollToRow(at: path!, at:UITableViewScrollPosition.top, animated: false)
        
        
        
        
        
        
        /*
         UIView.animate(withDuration: 0.3, delay: 0.0, options: UIViewAnimationOptions.curveLinear
         , animations: {
         
         
         /*     //   self.tableView.beginUpdates()
         self.tableView.scrollToRow(at: path!, at:UITableViewScrollPosition.middle, animated: false)
         self.tableView.reloadSections(IndexSet(integer: (path?.section)!) , with: UITableViewRowAnimation.left)
         
         // self.tableView.endUpdates()
         
         /* for cell  in self.tableView.visibleCells as! [CustomCell]
         {
         cell.closeCell()
         //cell.layoutSubviews()
         }*/
         
         self.tableView.scrollToRow(at: path!, at:UITableViewScrollPosition.middle, animated: false)*/
         
         // self.tableView.beginUpdates()
         //self.tableView.endUpdates()
         
         
         self.tableView.scrollToRow(at: path!, at:UITableViewScrollPosition.middle, animated: false)
         let range = NSMakeRange(0, self.tableView.numberOfSections)
         let sections = NSIndexSet(indexesIn: range)
         self.tableView.reloadSections(sections as IndexSet, with: .automatic)
         
         
         }, completion: { finished in
         
         })*/
        self.navigationItem.setLeftBarButton(nil, animated: true)
        self.navigationItem.setRightBarButton(nil, animated: true)
        
        
        
        
        tableView.separatorStyle = .singleLine
        
        // tableView.allowsSelection = true
        
        
    }
    @IBAction func info(_ sender: AnyObject) {
        //performSegue(withIdentifier: "StartToReminders", sender: self)
        performSegue(withIdentifier: "dict12", sender: nil)
        
    }
    private func setLoadingScreen() {
        
        // Sets the view which contains the loading text and the spinner
        let width: CGFloat = 120
        let height: CGFloat = 30
        let x = (self.tableView.frame.width / 2) - (width / 2)
        let y = (self.tableView.frame.height / 2) - (height / 2) - (self.navigationController?.navigationBar.frame.height)!
        // Sets loading text
        
        
        // Sets spinner
        self.spinner.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        self.spinner.startAnimating()
        spinner.center=tableView.center
        
        self.tableView.addSubview(spinner)
        tableView.separatorStyle = .none
        
    }
    func showLoadingScreen()
    {
        self.spinner.startAnimating()
        self.spinner.isHidden = false
        tableView.separatorStyle = .none
        
    }
    
    private func removeLoadingScreen() {
        
        // Hides and stops the text and the spinner
        self.spinner.stopAnimating()
        self.spinner.isHidden = true
        tableView.separatorStyle = .singleLine
    }
    
    
   
    
    
}

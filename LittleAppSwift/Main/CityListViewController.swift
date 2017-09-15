//
//  CityListViewController.swift
//  LittleAppSwift
//
//  Created by 曹奕程 on 2017/9/15.
//  Copyright © 2017年 曹奕程. All rights reserved.
//

// 城市列表
// 按省份分组显示全国的城市，点击组头可以收回当前组

import UIKit

class CityListViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK:======================================属性========================================
    var listTableView : UITableView! = nil
    var cityArray = [CityStateModel]()
    
    
    
    
    // MARK:======================================生命周期========================================
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "城市列表"
        
        listTableView = UITableView(frame: CGRect(x: 0, y: 64, width: kScreenWidth, height: kScreenHeight - 64), style: UITableViewStyle.plain)
        listTableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        listTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        listTableView.backgroundColor = UIColor.white
        listTableView.register(UINib(nibName: "CityListCell", bundle: Bundle.main), forCellReuseIdentifier: "CityListCell")
        listTableView.register(UINib(nibName: "CityListHeader", bundle: Bundle.main), forHeaderFooterViewReuseIdentifier: "CityListHeader")
        listTableView.delegate = self
        listTableView.dataSource = self
        view.addSubview(listTableView)
        
        // 加载城市列表
        loadCityData()
        
    }

    // MARK:======================================私有方法========================================
    // MARK:加载城市plist文件
    func loadCityData() {
        
        let path = Bundle.main.path(forResource: "ProvincesAndCities", ofType: "plist")
        let tempArray = NSArray(contentsOfFile: path!)
        
        for i in 0..<tempArray!.count {
            // 组头
            let dic = tempArray![i] as! [String : Any]
            let stateModel = CityStateModel()
            stateModel.State = dic["State"] as! String
            stateModel.isShow = false
            
            let Citys = dic["Citys"] as! NSArray
            var mCitys = [CityListModel]()
            
            // 城市
            for j in 0..<Citys.count {
                let dict = Citys[j] as! NSDictionary
                let model = CityListModel()
                model.city = dict["city"] as! String
                model.lon = dict["lon"] as! String
                model.lat = dict["lat"] as! String
                
                mCitys.append(model)
            }
            stateModel.Cities = mCitys as NSArray
            
            
        }
        
        // 刷新表视图
        listTableView.reloadData()
    }
    
    
    // MARK:======================================代理方法========================================
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let stateModel = cityArray[section] as CityStateModel
        if stateModel.isShow {
            // 展开
            return stateModel.Cities.count
        } else {
            // 不展开
            return 0
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return cityArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40.0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    
        // 头部
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CityListHeader") as! CityListHeader
        
        let cityStateModel = cityArray[section] as CityStateModel
        
        view.nameLabel.text = cityStateModel.State
        
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 单元格
        let cell : CityListCell = tableView.dequeueReusableCell(withIdentifier: "CityListCell", for: indexPath) as! CityListCell
        
        let cityStateModel = cityArray[indexPath.section] as CityStateModel
        let cityListModel = cityStateModel.Cities[indexPath.row] as CityListModel
        
        cell.nameLabel.text = cityListModel.city
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}

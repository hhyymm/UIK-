//
//  UITableViewCategory.swift
//  ChaiMiYouYan
//
//  Created by Avon Xu on 16/2/4.
//  Copyright © 2016年 Avon Xu. All rights reserved.
//
import UIKit
import Foundation

extension UITableView
{
    func registerNib(nibName:String) ->Void
    {
        self .registerNib(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: nibName)
    }

    func registerNib(nibName:String,cellID:String) ->Void
    {
        self .registerNib(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: cellID)
    }
    
    func registerClass(cellClass: AnyClass?) ->Void
    {
        self .registerClass(cellClass, forCellReuseIdentifier: getName(cellClass!))
    }
    

}

extension UICollectionView{
    func registerNib(nibName:String) ->Void
    {

        self .registerNib(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: nibName)
    }
    
    func registerNib(nibName:String,cellID:String) ->Void
    {
        self .registerNib(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: cellID)
    }
    
    func registerClass(cellClass: AnyClass?) ->Void
    {
        self .registerClass(cellClass, forCellWithReuseIdentifier: getName(cellClass!))
    }
    
    func registerHeadNib(nibName:String) ->Void
    {
        self .registerNib(UINib(nibName: nibName, bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: nibName)
    }
    
   

    
}
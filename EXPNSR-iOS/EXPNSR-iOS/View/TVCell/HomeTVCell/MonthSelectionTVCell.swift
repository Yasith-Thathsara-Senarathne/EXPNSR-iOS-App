//
//  DateSelectorTVCell.swift
//  EXPNSR-iOS
//
//  Created by Thathsara Senarathne on 12/2/20.
//

import Foundation
import MNkSupportUtilities
import Action

class MonthSelectionTVCell: MNkTableViewCell {
    private var collectionView: UICollectionView!
    
    // Data variable
    var data: [MonthModel] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    private var cellId: String {
        return "monthSelection_cell_id"
    }
    
    override func config() {
        backgroundColor = .clear
    }
    
    override func createViews() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.chain
            .dataSource(self)
            .delegate(self)
            .register(MonthSelectionCVCell.self, with: cellId)
            .bgColor(.clear)
    }
    
    override func insertAndLayoutSubviews() {
        addSubview(collectionView)
        collectionView.activateLayouts([.leading: 0, .traling: 0, .height: self.bounds.size.height])
    }
}

extension MonthSelectionTVCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MonthSelectionCVCell
        let currentMonth: MonthModel = MonthModel(id: Genaric().getCurrentDateAndTime(type: .dateAsId), title: Genaric().getCurrentDateAndTime(type: .yearWithMonth))
        cell.isCellSelected = data[indexPath.item].id == currentMonth.id
        cell.data = data[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width / 3
        let height = width * 1.4
        return CGSize.init(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard  let cellRect = collectionView.attributeFrame(forCellAt: indexPath) else { return }
        let _data = data[indexPath.item]
    }
}

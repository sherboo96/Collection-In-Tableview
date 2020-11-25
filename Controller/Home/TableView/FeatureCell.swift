//
//  FeatureCell.swift
//  Collection-In-Tableview
//
//  Created by Mahmoud Sherbeny on 11/22/20.
//

import UIKit

class FeatureCell: UITableViewCell {

    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var delegate: delegte?
    
    var currentIdx = 0
    var timer: Timer?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        
        collectionView.register(UINib(nibName: "FeatureCCell", bundle: nil), forCellWithReuseIdentifier: "FeatureCCell")
        pageControl.numberOfPages = 5
        pageControl.currentPage = 0
        playTimer()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension FeatureCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeatureCCell", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height - 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.cellTapped(isTapped: indexPath.row)
    }
    
}

extension FeatureCell {
    
    @objc func getCurrentIndex() {
        currentIdx = currentIdx != 4 ? currentIdx + 1 : 0
        let index = IndexPath(item: currentIdx, section: 0)
        pageControl.currentPage = currentIdx
        collectionView.scrollToItem(at: index, at: .left, animated: true)
    }
    
    func playTimer() {
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(getCurrentIndex), userInfo: nil, repeats: true)
    }
    
}

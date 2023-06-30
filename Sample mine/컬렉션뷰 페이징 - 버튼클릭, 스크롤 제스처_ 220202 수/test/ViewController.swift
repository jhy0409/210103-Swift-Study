
//
//  ViewController.swift
//  test
//
//  Created by inooph on 2022/02/02.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var collectionView: UICollectionView!
    let pageArr: [UIColor] = [.red, .orange, .yellow]
    
    var currentIdx: CGFloat = 0.0
    var value: CGFloat = 0
    
    // MARK: - view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pageArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? cellTest else { return UICollectionViewCell() }
        
        cell.backgroundColor = pageArr[indexPath.item]
        
        return cell
    }
    
    @IBAction func buttonFirstAction(_ sender: UIButton) {
        testPrint(sender.tag, name: "sender.tag")
        testPrint(IndexPath(item: sender.tag, section: 0), name: "IndexPath(item: sender.tag, section: 0)")
        let rect = self.collectionView.layoutAttributesForItem(at: IndexPath(row: sender.tag, section: 0))?.frame
        self.collectionView.scrollRectToVisible(rect!, animated: true)
    }
    
    @IBAction func buttonSecondAction(_ sender: UIButton) {
        testPrint(sender.tag, name: "sender.tag")
        testPrint(IndexPath(item: sender.tag, section: 0), name: "IndexPath(item: sender.tag, section: 0)")
        let rect = self.collectionView.layoutAttributesForItem(at: IndexPath(row: sender.tag, section: 0))?.frame
        self.collectionView.scrollRectToVisible(rect!, animated: true)
    }
    
    @IBAction func buttonThirdAction(_ sender: UIButton) {
        testPrint(sender.tag, name: "sender.tag")
        testPrint(IndexPath(item: sender.tag, section: 0), name: "IndexPath(item: sender.tag, section: 0)")
        let rect = self.collectionView.layoutAttributesForItem(at: IndexPath(row: sender.tag, section: 0))?.frame
        self.collectionView.scrollRectToVisible(rect!, animated: true)
    }
    
    func testPrint(_ any: Any, name: String) {
        print("--> \(name) = \(any)")
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = 60
        let width: CGFloat = view.frame.width
        
        return CGSize(width: width, height: height)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let value = scrollView.contentOffset.x/scrollView.frame.size.width
        self.value = value
        if let cv = scrollView as? UICollectionView {
            
            let layout = cv.collectionViewLayout as! UICollectionViewFlowLayout
            let cellWidth = layout.itemSize.width + layout.minimumLineSpacing
            
            var offset = targetContentOffset.pointee
            let idx = round((offset.x + cv.contentInset.left) / cellWidth)
            
            if idx > currentIdx {
                currentIdx += 1
            } else if idx < currentIdx {
                if currentIdx != 0 {
                    currentIdx -= 1
                }
            }
            
            offset = CGPoint(x: currentIdx * cellWidth - cv.contentInset.left, y: 0)
            
            targetContentOffset.pointee = offset
            
        }
    }
}

class cellTest: UICollectionViewCell {
    
}

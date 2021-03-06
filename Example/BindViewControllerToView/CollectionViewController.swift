//
//  CollectionViewController.swift
//  CellViewController
//
//  Created by Francisco Gonçalves on 19/12/15.
//  Copyright © 2015 CocoaPods. All rights reserved.
//

import UIKit
import BindViewControllerToView

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

  var model: [String] = ["Hello World", "Hello World", "Hello World", "Hello World", "Hello World", "Hello World", "Hello World", "Hello World", "Hello World", "Hello World", "Hello World", "Hello World", "Hello World", "Hello World", "Hello World", "Hello World", "Hello World", "Hello World"]

	override func viewDidLoad() {
		super.viewDidLoad()

		// Register cell classes
		self.collectionView!.registerClass(MyCollectionCell.self, forCellWithReuseIdentifier: reuseIdentifier)
	}

}

// MARK: UICollectionViewDataSource
extension CollectionViewController {
	override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
		return 1
	}

	override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return model.count
	}

	override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath)

		if let cell = cell as? MyCollectionCell {
      cell.parentViewController = self
      cell.viewController?.model = model[indexPath.item]
    }

		return cell
	}

	func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
		return CGSize(width: 300, height: 300)
	}
	
}

//
//  InformationCell.swift
//  KAppStore
//
//  Created by aney on 2017. 6. 6..
//  Copyright © 2017년 Taedong Kim. All rights reserved.
//

import UIKit

class InfomationCell: UICollectionViewCell {
  
  // MARK: Constants
  
  struct Font {
    // 스토리보드 폰트 크기
    static let keyLabel = UIFont.systemFont(ofSize: 12)
    static let valueLabel = UIFont.systemFont(ofSize: 12)
  }
  
  // MARK: UI
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var keyLabel: UILabel!
  @IBOutlet weak var valueLabel: UILabel!
  
  
  // MARK: View Life Cycle
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  
  // MARK: Configuring
  
  func configure(title: String, dictionary: [String: String]) {
    self.titleLabel.text = title
    
    dictionary.forEach { (key: String, value: String) in
      self.keyLabel.text = key
      self.valueLabel.text = value
    }
    
    self.setNeedsLayout()
  }
  
  
  // MARK: height
  
  class func height(width: CGFloat, description: String?) -> CGFloat {
    let height: CGFloat = 20 + 6 + 6 + 1
    let keyValueHeight = description?.size(width: width, font: Font.keyLabel).height ?? 0
    let minimumHeight = ceil(Font.keyLabel.lineHeight * 1)
    return height + max(keyValueHeight, minimumHeight) + 20 // cell 내부 insets
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()

    self.keyLabel.sizeToFit()
    self.valueLabel.sizeToFit()
  }
  
}

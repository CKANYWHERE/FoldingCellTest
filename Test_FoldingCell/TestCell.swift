//
//  TestCell.swift
//  Test_FoldingCell
//
//  Created by 민창경 on 2020/12/01.
//
import UIKit
import FoldingCell
//import EasyPeasy
import SnapKit

class TestFoldingCell: FoldingCell {

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
// MARK: - Prevent App Crash
//     assign empty Constraints to prevent app crash
//    from configureDefaultState() in FoldingCell.swift
    containerViewTop = NSLayoutConstraint()
    foregroundViewTop = NSLayoutConstraint()
    
    containerView = createContainerView()
    foregroundView = createForegroundView()
    
    // super class method configure views
    commonInit()
 }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func animationDuration(_ itemIndex: NSInteger, type: AnimationType) -> TimeInterval {
  
    // durations count equal it itemCount
    let durations = [0.33, 0.26, 0.26] // timing animation for each view
    return durations[itemIndex]
  }
}

// MARK: Configure
extension TestFoldingCell {
  
  private func createForegroundView() -> RotatedView {
    // MARK: - Apply 'Then'
    let foregroundView = RotatedView(frame: .zero).then {
      $0.backgroundColor = .orange
    }
    
    contentView.addSubview(foregroundView)
    
    // MARK: - Remove 'EasyPeasy' and apply 'SnapKit'
    foregroundView.snp.makeConstraints {
      $0.height.equalTo(75)
      $0.leading.top.trailing.equalToSuperview().offset(8)
    }
    foregroundView.layoutIfNeeded()
    
    return foregroundView
  }
  
  private func createContainerView() -> UIView {
    // MARK: - Apply 'Then'
    let containerView = UIView(frame: .zero).then {
      $0.backgroundColor = .green
    }
    
    contentView.addSubview(containerView)
    
    // MARK: - Remove 'EasyPeasy' and apply 'SnapKit'
    containerView.snp.makeConstraints {
      $0.height.equalTo(75 * itemCount)
      $0.leading.top.trailing.equalToSuperview().offset(8)
    }
    
    containerView.layoutIfNeeded()
    
    return containerView
  }
}

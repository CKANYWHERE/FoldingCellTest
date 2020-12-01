//
//  TestCell.swift
//  Test_FoldingCell
//
//  Created by 민창경 on 2020/12/01.
//

import UIKit
import FoldingCell


class TestCell: FoldingCell {
    
//    FoldingCell.containerView = UIView()
//    FoldingCell.foregroundView = RotatedView()
    //var cell : FoldingCell = FoldingCell()
    
    //var containerView:UIView?
  
    
    lazy var lblIntForeGround = UILabel().then{
        $0.font = UIFont.boldSystemFont(ofSize: 30)
        $0.text = "1"
        $0.textAlignment = .center
    }
    
    lazy var lblIntContainer = UILabel().then{
        $0.font = UIFont.boldSystemFont(ofSize: 50)
        $0.text = "1"
        $0.textAlignment = .center
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "testCell")
        foregroundView = createForegroundView()
        containerView = createContainerView()
        foregroundView.addSubview(lblIntForeGround)
        containerView.addSubview(lblIntContainer)
        setConstraintForeGround()
    }
        
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {

        super.awakeFromNib()
    }

    override func animationDuration(_ itemIndex: NSInteger, type _: FoldingCell.AnimationType) -> TimeInterval {
        let durations = [0.26, 0.2, 0.2]
        return durations[itemIndex]
    }
    
    func setConstraintForeGround(){
        lblIntForeGround.snp.makeConstraints{
            $0.centerX.equalTo(foregroundView)
            $0.centerY.equalTo(foregroundView)
            $0.width.equalTo(foregroundView)
            $0.height.equalTo(foregroundView).dividedBy(2)
        }
    }
    
    func setConstraintContainer(){
        lblIntContainer.snp.makeConstraints{
            $0.centerX.equalTo(containerView)
            $0.centerY.equalTo(containerView)
            $0.width.equalTo(containerView)
            $0.height.equalTo(containerView).dividedBy(2)
        }
    }
}

extension TestCell{
    
    private func createForegroundView() -> RotatedView {
        let foregroundView = RotatedView(frame: .zero).then {
         $0.backgroundColor = .red
         $0.translatesAutoresizingMaskIntoConstraints = false
       }
        
        
        contentView.addSubview(foregroundView)
        foregroundView.layoutIfNeeded()
        
        foregroundView.snp.makeConstraints{
            $0.centerX.centerY.equalTo(contentView)
            $0.width.height.equalTo(contentView)
        }
        return foregroundView
    }
    
    private func createContainerView() -> UIView {
        let containerView = UIView(frame: .zero).then{
            $0.backgroundColor = .green
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
      
        contentView.addSubview(containerView)
        containerView.layoutIfNeeded()
        
        containerView.snp.makeConstraints{
            $0.centerX.centerY.equalTo(contentView)
            $0.width.height.equalTo(contentView)
        }
        
        return containerView
    }
}


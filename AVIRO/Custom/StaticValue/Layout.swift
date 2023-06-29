//
//  StaticValue.swift
//  AVIRO
//
//  Created by 전성훈 on 2023/06/14.
//

import UIKit

struct Layout {
    // MARK: Inset
    struct Inset {
        static let leadingTop = CGFloat(16)
        static let trailingBottom = CGFloat(-16)
        
        static let leadingTopPlus = CGFloat(20)
        static let trailingBottomPlus = CGFloat(-20)
        
        static let leadingTopDouble = CGFloat(32)
        static let trailingBottomDouble = CGFloat(-32)
        
        static let leadingTopHalf = CGFloat(8)
        static let trailingBottomHalf = CGFloat(-8)
        
        static let leadingTopSmall = CGFloat(4)
        static let trailingBottomSmall = CGFloat(-4)
    
        static let separatorCornerRadius = CGFloat(2.5)
        static let buttonStackViewSpacing = CGFloat(5)
        
        // MARK: 가게 리스트만 해당되는 Inset
        static let iconInest = CGFloat(25)
        static let iconToLabel = CGFloat(10)
        static let tableToField = CGFloat(5)
    }
    
    // MARK: 공통 button
    struct Button {
        static let cornerRadius = CGFloat(28)
        static let font = UIFont.systemFont(ofSize: 18, weight: .bold)
        static let height = CGFloat(54)
    }
    
    // MARK: 공통 TextField
    struct TextField {
        
    }
    
    // MARK: 공통 Label
    struct Label {
        static let mainTitle = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        static let bigTitile = UIFont.systemFont(ofSize: 25, weight: .bold)
        static let bigNormal = UIFont.systemFont(ofSize: 18, weight: .regular)
        
        static let tableSubTitle = UIFont.systemFont(ofSize: 14, weight: .medium)
        static let tableDistance = UIFont.systemFont(ofSize: 14, weight: .medium)
        
        static let subTitle = UIFont.systemFont(ofSize: 12, weight: .light)
    }
    
    // MARK: Slide View
    struct SlideView {
        static let height = CGFloat(280)
        static let firstHeight = CGFloat(270)
        
        static let lineCornerRadius = 2.5
        static let imageToTextInset = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 10)
        
        static let cornerRadius = CGFloat(30)
        static let shadowColor = UIColor.mainTitle?.cgColor
        static let shadowOffset = CGSize(width: -2, height: 2)
        static let shadowRadius = 4
        static let shadowOpacity = 0.25
        
        static let titleFont = 20
        static let addressFont = 16
    }
    
    // MARK: Home View
    struct HomeView {
        static let minusLocationInset = CGFloat(-4)
    }
    
    // MARK: Detail View
    struct DetailView {
        static let viewCornerRadius = CGFloat(16)
        
        static let fisrtViewHeightInset = CGFloat(76)
    }
    
    // MARK: Inroll View
    struct InrollView {
        static let labelToLabel = CGFloat(3)
        static let labelToField = CGFloat(8)
        static let fieldToField = CGFloat(12)
        
        static let notRequestTableConstant = CGFloat(16)
        
        static let requestBetween = CGFloat(10)
        
        static let requestTableConstant = notRequestTableConstant + requestBetween
        
        static let checkBoxCornerRadius = 15 
    }
}

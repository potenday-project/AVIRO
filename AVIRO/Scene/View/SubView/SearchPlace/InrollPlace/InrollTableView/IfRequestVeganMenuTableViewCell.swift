//
//  IfRequestVeganMenuTableViewCell.swift
//  AVIRO
//
//  Created by 전성훈 on 2023/05/25.
//

import UIKit

final class IfRequestVeganMenuTableViewCell: UITableViewCell {
    static let identifier = "IfRequest"
    
    var menuTextField = InrollTextField()
    var priceTextField = InrollTextField()
    var requestButton = UIButton()
    var detailTextField = InrollTextField()
    
    var topStackView = UIStackView()
    
    var check = false
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        makeLayout()
        makeAttribute()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        menuTextField.removeTarget(nil, action: nil, for: .allEvents)
        priceTextField.removeTarget(nil, action: nil, for: .allEvents)
        detailTextField.removeTarget(nil, action: nil, for: .allEvents)
    }
    
    private func makeLayout() {
        [
            menuTextField,
            priceTextField
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            topStackView.addArrangedSubview($0)
        }
        
        topStackView.axis = .horizontal
        topStackView.spacing = Layout.InrollView.fieldToField
        topStackView.distribution = .fillEqually
        
        [
            topStackView,
            requestButton,
            detailTextField
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            // topStackView
            topStackView.topAnchor.constraint(
                equalTo: contentView.topAnchor, constant: Layout.InrollView.notRequestTableConstant),
            topStackView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor),
            topStackView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor),

            // requestButton
            requestButton.topAnchor.constraint(
                equalTo: topStackView.bottomAnchor, constant: Layout.InrollView.requestBetween),
            requestButton.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor),
            requestButton.heightAnchor.constraint(
                equalTo: menuTextField.heightAnchor, multiplier: 1),
            requestButton.widthAnchor.constraint(
                equalTo: requestButton.heightAnchor, multiplier: 1),
            requestButton.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor),

            // detailTextField
            detailTextField.topAnchor.constraint(
                equalTo: topStackView.bottomAnchor, constant: Layout.InrollView.requestBetween),
            detailTextField.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor),
            detailTextField.leadingAnchor.constraint(
                equalTo: requestButton.trailingAnchor, constant: Layout.InrollView.fieldToField),
            detailTextField.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func makeAttribute() {
        self.backgroundColor = .clear
        
        menuTextField.placeholder = StringValue.InrollView.menuPlaceHolder
        menuTextField.textColor = .mainTitle
        priceTextField.placeholder = StringValue.InrollView.pricePlaceHolder
        priceTextField.textColor = .mainTitle
                
        requestButton.setTitle(StringValue.InrollView.requestButtonTitle, for: .normal)
        requestButton.setTitleColor(.placeholderText, for: .normal)
        requestButton.backgroundColor = .clear
        requestButton.layer.borderWidth = 1
        requestButton.layer.borderColor = UIColor.separateLine?.cgColor
        requestButton.layer.cornerRadius = 15
        requestButton.addTarget(self, action: #selector(requestButtonTapped), for: .touchUpInside)
        
        detailTextField.isEnabled = false
        detailTextField.textColor = .black
        detailTextField.placeholder = StringValue.InrollView.detailPlaceHolder
        
    }
    
    @objc func requestButtonTapped() {
        if check == false {
            detailTextField.isEnabled = true
            requestButton.setTitle("", for: .normal)
            requestButton.setImage(Image.InrollView.checkImage, for: .normal)
            check = true
        } else {
            detailTextField.text = ""
            detailTextField.isEnabled = false
            requestButton.setTitle(StringValue.InrollView.requestButtonTitle, for: .normal)
            requestButton.setImage(nil, for: .normal)
            check = false

        }
    }
    
    func dataBinding(_ name: String, _ price: String, _ detail: String, _ ischeck: Bool) {
        menuTextField.text = name
        priceTextField.text = price
        detailTextField.text = detail
        if ischeck {
            detailTextField.isEnabled = true
            detailTextField.backgroundColor = .white
            requestButton.setTitle("", for: .normal)
            requestButton.setImage(Image.InrollView.checkImage, for: .normal)
        }
    }
}

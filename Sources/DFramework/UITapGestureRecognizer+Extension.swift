//
//  UITapGestureRecognizer+Extension.swift
//  
//
//  Created by Yusuf Demirci on 29.03.2022.
//

import UIKit

public extension UITapGestureRecognizer {

    func didTapAttributedString(_ string: String, in label: UILabel) -> Bool {
        guard let text = label.text else { return false }
        let range = (text as NSString).range(of: string)
        return self.didTapAttributedText(label: label, inRange: range)
    }
}

private extension UITapGestureRecognizer {

    func didTapAttributedText(label: UILabel, inRange targetRange: NSRange) -> Bool {
        guard let attributedText = label.attributedText else {
            assertionFailure("attributedText must be set")
            return false
        }

        let textContainer = createTextContainer(for: label)

        let layoutManager: NSLayoutManager = .init()
        layoutManager.addTextContainer(textContainer)

        let textStorage: NSTextStorage = .init(attributedString: attributedText)
        if let font = label.font {
            textStorage.addAttribute(NSAttributedString.Key.font, value: font, range: .init(location: 0, length: attributedText.length))
        }
        textStorage.addLayoutManager(layoutManager)

        let locationOfTouchInLabel = location(in: label)
        let textBoundingBox = layoutManager.usedRect(for: textContainer)
        let alignmentOffset = aligmentOffset(for: label)

        let xOffset = ((label.bounds.size.width - textBoundingBox.size.width) * alignmentOffset) - textBoundingBox.origin.x
        let yOffset = ((label.bounds.size.height - textBoundingBox.size.height) * alignmentOffset) - textBoundingBox.origin.y
        let locationOfTouchInTextContainer = CGPoint(x: locationOfTouchInLabel.x - xOffset, y: locationOfTouchInLabel.y - yOffset)

        let characterTapped = layoutManager.characterIndex(for: locationOfTouchInTextContainer, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)

        let lineTapped = Int(ceil(locationOfTouchInLabel.y / label.font.lineHeight)) - 1
        let rightMostPointInLineTapped: CGPoint = .init(x: label.bounds.size.width, y: label.font.lineHeight * CGFloat(lineTapped))
        let charsInLineTapped = layoutManager.characterIndex(for: rightMostPointInLineTapped, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)

        return characterTapped < charsInLineTapped ? targetRange.contains(characterTapped) : false
    }

    func createTextContainer(for label: UILabel) -> NSTextContainer {
        let textContainer: NSTextContainer = .init(size: label.bounds.size)
        textContainer.lineFragmentPadding = 0
        textContainer.lineBreakMode = label.lineBreakMode
        textContainer.maximumNumberOfLines = label.numberOfLines
        return textContainer
    }

    func aligmentOffset(for label: UILabel) -> CGFloat {
        switch label.textAlignment {
        case .left, .natural, .justified:
            return 0
        case .center:
            return 0
        case .right:
            return 1
        @unknown default:
            return 0
        }
    }
}

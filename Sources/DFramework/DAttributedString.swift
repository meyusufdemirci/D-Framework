//
//  File.swift
//  
//
//  Created by Yusuf Demirci on 3.03.2022.
//

import UIKit

public class DAttributedString {

    // MARK: - Properties

    public let attributedString: NSMutableAttributedString

    public var font: UIFont {
        didSet {
            addAttribute([NSAttributedString.Key.font: font])
        }
    }
    public var color: UIColor {
        didSet {
            addAttribute([NSAttributedString.Key.foregroundColor: color])
        }
    }
    public var alignment: NSTextAlignment = NSTextAlignment.natural {
        didSet {
            paragraphStyle.alignment = alignment
            addAttribute([NSAttributedString.Key.paragraphStyle: paragraphStyle])
        }
    }
    public var lineSpacing: CGFloat {
        didSet {
            paragraphStyle.lineSpacing = lineSpacing
            addAttribute([NSAttributedString.Key.paragraphStyle: paragraphStyle])
        }
    }
    public var underlineStyle: NSUnderlineStyle? {
        didSet {
            guard let underlineStyle = underlineStyle else { return }
            addAttribute([NSAttributedString.Key.underlineStyle: underlineStyle.rawValue])
        }
    }

    private var string: String = ""
    private var range: NSRange {
        return (string as NSString).range(of: string)
    }
    private var attributes: [[NSAttributedString.Key: Any]] = [[:]]
    private var paragraphStyle: NSMutableParagraphStyle = .init()

    public init(string: String) {
        self.string = string

        attributedString = .init(string: string)
        font = .preferredFont(forTextStyle: .body)
        color = .black
        lineSpacing = 0
    }
}

// MARK: - Publics

extension DAttributedString {

    public func insert(_ willInsertAttributedString: DAttributedString) {
        let insertRange: NSRange = (string as NSString).range(of: willInsertAttributedString.string)

        for attribute in willInsertAttributedString.attributes {
            attributedString.addAttributes(attribute, range: insertRange)
        }
    }
}

// MARK: - Privates

private extension DAttributedString {

    func addAttribute(_ attribute: [NSAttributedString.Key: Any]) {
        attributedString.addAttributes(attribute, range: range)
        attributes.append(attribute)
    }
}

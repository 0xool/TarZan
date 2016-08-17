//
//  KaedeTextField.swift
//
//  Created by Cyrus Refahi on 20/01/2015.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import UIKit

/**
 A KaedeTextField is a subclass of the TextFieldEffects object, is a control that displays an UITextField with a customizable visual effect around the foreground of the control.
 */
@IBDesignable public class KaedeTextField: TextFieldEffects {
    
    /**
     The color of the placeholder text.
     
     This property applies a color to the complete placeholder string. The default value for this property is a black color.
     */
    @IBInspectable dynamic public var placeholderColor: UIColor? {
        didSet {
            updatePlaceholder()
        }
    }
    
    /**
     The scale of the placeholder font.
     
     This property determines the size of the placeholder label relative to the font size of the text field.
     */
    @IBInspectable dynamic public var placeholderFontScale: CGFloat = 0.8 {
        didSet {
            updatePlaceholder()
        }
    }
    
    /**
     The view’s foreground color.
     
     The default value for this property is a clear color.
     */
    @IBInspectable dynamic public var foregroundColor: UIColor? {
        didSet {
            updateForegroundColor()
        }
    }
    
    override public var placeholder: String? {
        didSet {
            updatePlaceholder()
        }
    }
    
    override public var bounds: CGRect {
        didSet {
            drawViewsForRect(bounds)
        }
    }
    
    private let foregroundView = UIView()
    private let placeholderInsets = CGPoint(x: 0, y: 5)
    private let textFieldInsets = CGPoint(x: 0, y: 0)
        
    // MARK: - TextFieldsEffects

    override public func drawViewsForRect(rect: CGRect) {
        var frame = CGRect(origin: CGPointZero, size: CGSize(width: rect.size.width, height: rect.size.height))
        
        
        
        foregroundView.frame = frame
        foregroundView.userInteractionEnabled = false
        placeholderLabel.frame = CGRectInset(frame, placeholderInsets.x , placeholderInsets.y)
        placeholderLabel.frame.origin = CGPoint(x: bounds.size.width * 0.7, y: self.placeholderInsets.y)
        print("foregroundc \(foregroundView.bounds.width)")
        print("foregroundc with size \(foregroundView.bounds.size.width)")
        print("bound with size \(bounds.size.width)")
        //print("foregroundc \()")
        print("bounds \(self.frame.size.width)")
        placeholderLabel.font = placeholderFontFromFont(font!)
        
        updateForegroundColor()
        updatePlaceholder()
        
        if text!.isNotEmpty || isFirstResponder() {
            animateViewsForTextEntry()
        }
        
        addSubview(foregroundView)
        addSubview(placeholderLabel)        
    }
    
    override public func animateViewsForTextEntry() {
        UIView.animateWithDuration(0.35, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 2.0, options: .BeginFromCurrentState, animations: ({
            self.placeholderLabel.frame.origin = CGPoint(x: 20, y: self.placeholderInsets.y)
        }), completion: nil)
        
        UIView.animateWithDuration(0.45, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1.5, options: .BeginFromCurrentState, animations: ({
            self.foregroundView.frame.origin = CGPoint(x: -(self.frame.size.width * 0.6), y: 0)
        }), completion: { _ in
            self.animationCompletionHandler?(type: .TextEntry)
        })
    }
    
    override public func animateViewsForTextDisplay() {
        if text!.isEmpty {
            UIView.animateWithDuration(0.3, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 2.0, options: .BeginFromCurrentState, animations: ({
                self.placeholderLabel.frame.origin.x = self.bounds.size.width * 0.7
            }), completion: nil)
            
            UIView.animateWithDuration(0.3, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 2.0, options: .BeginFromCurrentState, animations: ({
                self.foregroundView.frame.origin = CGPointZero
            }), completion: { _ in
                self.animationCompletionHandler?(type: .TextDisplay)
            })
        }
    }
    
    // MARK: - Private
    
    private func updateForegroundColor() {
        foregroundView.backgroundColor = foregroundColor
    }
    
    private func updatePlaceholder() {
        placeholderLabel.text = placeholder
        placeholderLabel.textColor = placeholderColor
    }
    
    private func placeholderFontFromFont(font: UIFont) -> UIFont! {
        let smallerFont = UIFont(name: font.fontName, size: font.pointSize * placeholderFontScale)
        return smallerFont
    }
    
    // MARK: - Overrides
        
    override public func editingRectForBounds(bounds: CGRect) -> CGRect {
        var frame = CGRect(origin: bounds.origin, size: CGSize(width: bounds.size.width * 0.6, height: bounds.size.height))
        frame.origin.x = frame.origin.x + bounds.size.width * 0.4
        print(bounds.size.width)
        return CGRectInset(frame, 0 , textFieldInsets.y)
    }
    
    override public func textRectForBounds(bounds: CGRect) -> CGRect {
        var frame = CGRect(origin: bounds.origin, size: CGSize(width: bounds.size.width * 0.6, height: bounds.size.height))
        frame.origin.x = frame.origin.x + bounds.size.width * 0.4
        return CGRectInset(frame, 0 , textFieldInsets.y)
    }
    
}
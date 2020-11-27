//
//  MNkVerticalAlignButton.swift
//  MNkSupportUtilities
//
//  Created by MNk_Dev on 9/11/18.
//
import UIKit
open class MNkVerticalAlignButton: MNkView {
    
    public var contentEdgeInset:UIEdgeInsets = UIEdgeInsets.init(top:4, left:4, bottom:4, right:4){
        didSet{
            vStack.layoutMargins = contentEdgeInset
        }
    }
    
    public var spacing: CGFloat = 4 {
        didSet {
            vStack.spacing = spacing
        }
    }
    
    public var imageEdgeInset: UIEdgeInsets = .zero {
        didSet {
            imageView.removeAllConstraints()
            imageView.activateLayouts([.top: imageEdgeInset.top, .bottom: -imageEdgeInset.bottom, .leading: imageEdgeInset.left, .traling: -imageEdgeInset.right])
            self.setNeedsDisplay()
        }
    }
    
    public var imageView:UIImageView!
    public var titleLabel:UILabel!
    
    private var vStack:UIStackView!
    
    private var tapGestureRecognizer = UITapGestureRecognizer()
    
    
    open override func createViews() {
        imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.setContentHuggingPriority(.defaultLow, for: .vertical)

        titleLabel = UILabel()
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.minimumScaleFactor = 0.5
        titleLabel.textAlignment = .center
        titleLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        tapGestureRecognizer = UITapGestureRecognizer()
        tapGestureRecognizer.delegate = self
        
        let imageViewContainer = UIView()
        imageViewContainer.addSubview(imageView)
        imageView.activateLayouts([.top: imageEdgeInset.top, .bottom: -imageEdgeInset.bottom, .leading: imageEdgeInset.left, .traling: -imageEdgeInset.right])
        
        vStack = UIStackView.init(arrangedSubviews: [imageViewContainer,titleLabel])
        vStack.axis = .vertical
        vStack.spacing = spacing
        vStack.layoutMargins = contentEdgeInset
        vStack.isLayoutMarginsRelativeArrangement = true
    }
    
    open override func insertAndLayoutSubviews() {
        self.addGestureRecognizer(tapGestureRecognizer)
        self.addSubview(vStack)
        vStack.activateLayouts(to: self)
    }
    
    open override func config() {
        backgroundColor = .clear
    }
    
    public func addTarget(target:Any,_ selector:Selector){
        self.tapGestureRecognizer.addTarget(target, action: selector)
    }
    
    fileprivate func animateClick(){
        
        UIView.animateKeyframes(withDuration: 0.3, delay: 0, options: .calculationModeCubic, animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.2, animations: {
                self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.1, animations: {
                self.transform = .identity
            })
            
        }, completion: nil)
    }
}

extension MNkVerticalAlignButton:UIGestureRecognizerDelegate{
    override open func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        animateClick()
        return true
    }
}


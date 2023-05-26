//
//  CustomPresentation.swift
//  AVIRO
//
//  Created by 전성훈 on 2023/05/21.
//

import UIKit

// MARK: TableView present custom
final class CustomPresentation: UIPresentationController {
    override var frameOfPresentedViewInContainerView: CGRect {
        guard let containerView = containerView else { return .zero }
        return CGRect(
            x: 6,
            y: containerView.bounds.height / 3,
            width: containerView.bounds.width - 2 * 6,
            height: containerView.bounds.height * 2 / 3
        )
    }

    override func presentationTransitionWillBegin() {
        containerView?.addSubview(presentedView!)
    }
}

class SlideAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    let isPresentation: Bool
    
    init(isPresentation: Bool) {
        self.isPresentation = isPresentation
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let key: UITransitionContextViewControllerKey = isPresentation ? .to : .from
        guard let controller = transitionContext.viewController(forKey: key) else { return }
        
        if isPresentation {
            transitionContext.containerView.addSubview(controller.view)
        }
        
        let presentedFrame = transitionContext.finalFrame(for: controller)
        var dismissedFrame = presentedFrame
        dismissedFrame.origin.y = transitionContext.containerView.frame.size.height
        
        let initialFrame = isPresentation ? dismissedFrame : presentedFrame
        let finalFrame = isPresentation ? presentedFrame : dismissedFrame
        
        let animationDuration = transitionDuration(using: transitionContext)
        controller.view.frame = initialFrame
        UIView.animate(withDuration: animationDuration, animations: {
            controller.view.frame = finalFrame
        }, completion: { finished in
            if !self.isPresentation {
                controller.view.removeFromSuperview()
            }
            transitionContext.completeTransition(finished)
        })
    }
}

//extension HomeViewController: UIViewControllerTransitioningDelegate {
//    func presentationController(
//        forPresented presented: UIViewController,
//        presenting: UIViewController?,
//        source: UIViewController
//    ) -> UIPresentationController? {
//        return CustomPresentation(presentedViewController: presented, presenting: presenting)
//    }
//
//    func animationController(
//        forPresented presented: UIViewController,
//        presenting: UIViewController,
//        source: UIViewController
//    ) -> UIViewControllerAnimatedTransitioning? {
//        return SlideAnimator(isPresentation: true)
//    }
//
//    func animationController(
//        forDismissed dismissed: UIViewController
//    ) -> UIViewControllerAnimatedTransitioning? {
//        return SlideAnimator(isPresentation: false)
//    }
//}

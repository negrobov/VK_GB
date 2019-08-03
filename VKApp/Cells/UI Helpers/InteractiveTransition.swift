import UIKit

class CustomInteractiveTransition: UIPercentDrivenInteractiveTransition {
    
    var interactiveTransitionHasStarted = false
    var interactiveTransitionShouldFinish = false
}

class CustomNC: UINavigationController, UINavigationControllerDelegate {
    let interactiveTransition = CustomInteractiveTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        
        let swipeFromEdgePanGR = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        swipeFromEdgePanGR.edges = .left
        view.addGestureRecognizer(swipeFromEdgePanGR)
    }
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        
        return interactiveTransition.interactiveTransitionHasStarted ? interactiveTransition : nil
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push {
            return TransitionManager()
        } else if operation == .pop {
            return TransitionManager()
        }
        
        return nil
    }
    
    @objc private func handlePanGesture(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        
        switch recognizer.state {
            
        case .began:
            interactiveTransition.interactiveTransitionHasStarted = true
            self.popViewController(animated: true)
            
        case .changed:
            guard let width = recognizer.view?.bounds.width else {
                interactiveTransition.interactiveTransitionHasStarted = false
                interactiveTransition.cancel()
                return }
            let translation = recognizer.translation(in: recognizer.view)
            let relativeTranslation = translation.x / width
            let progress = max(0, min(1, relativeTranslation))
            
            interactiveTransition.update(progress)
            interactiveTransition.interactiveTransitionShouldFinish = progress > 0.35
            
        case .ended:
            interactiveTransition.interactiveTransitionHasStarted = false
            interactiveTransition.interactiveTransitionShouldFinish ? interactiveTransition.finish() : interactiveTransition.cancel()
            
        case .cancelled:
            interactiveTransition.interactiveTransitionHasStarted = false
            interactiveTransition.cancel()
            
        default:
            break
        }
    }
}

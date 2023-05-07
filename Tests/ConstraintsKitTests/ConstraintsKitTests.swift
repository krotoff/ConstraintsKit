import XCTest
@testable import ConstraintsKit

final class ConstraintsKitTests: XCTestCase {

    private var parentView: UIView!
    private var childView: UIView!
    private var childFrameToAssert: CGRect!

    private let parentFrame = CGRect(x: 0, y: 0, width: 200, height: 200)

    override func setUp() {
        super.setUp()

        parentView = UIView()
        childView = UIView()
        parentView.addSubview(childView)
        parentView.frame = parentFrame
    }

    override func tearDown() {
        parentView = nil
        childView = nil
        childFrameToAssert = nil
    }

    func testAlignDefault() {
        childView
            .align(with: parentView)

        childFrameToAssert = parentFrame

        setLayoutAndCheck()
    }

    func testAlignTopLeadingAndSizeMultiplier() {
        let insets = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 0)
        let multipliers = CGPoint(x: 0.5, y: 0.3)

        childView
            .align(with: parentView, edges: [.left, .top], insets: insets)
            .equalsSize(to: parentView, multipliers: multipliers)

        childFrameToAssert = CGRect(
            x: insets.left,
            y: insets.top,
            width: parentFrame.width * multipliers.x,
            height: parentFrame.height * multipliers.y
        )

        setLayoutAndCheck()
    }

    func testAlignBottomTrailingAndConstantSize() {
        let insets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let size = CGSize(width: 100, height: 100)

        childView
            .align(with: parentView, edges: [.bottom, .right], insets: insets)
            .equalsSize(to: size)

        childFrameToAssert = CGRect(
            x: parentFrame.width - size.width - insets.right,
            y: parentFrame.height - size.height - insets.bottom,
            width: size.width,
            height: size.height
        )

        setLayoutAndCheck()
    }

    func testAlignLeadingCenterVerticallyAndEqualsSizeWithConstants() {
        let insets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

        childView
            .align(with: parentView, edges: .left, insets: insets)
            .centerVertically(with: parentView)
            .equalsSize(
                to: parentView,
                constants: .init(x: -(insets.left + insets.right), y: -(insets.top + insets.bottom))
            )

        childFrameToAssert = CGRect(
            x: insets.left,
            y: insets.top,
            width: parentFrame.width - insets.left - insets.right,
            height: parentFrame.height - insets.top - insets.bottom
        )

        setLayoutAndCheck()
    }



    func testCenterWithConstantsAndEqualsSize() {
        let insets = CGPoint(x: -parentFrame.width / 2, y: -parentFrame.height / 2)

        childView
            .center(with: parentView, constants: insets)
            .equalsSize(to: parentView)

        childFrameToAssert = .init(origin: insets, size: parentFrame.size)

        setLayoutAndCheck()
    }

    func testSpacingToLeading() {
        let (secondChildView, inset, width) = setAndGetSecondView(isHorizontal: true)

        childView
            .spacingToLeading(of: secondChildView, constant: inset)
            .align(with: parentView, edges: [.top, .bottom, .left])
            .equalsSize(to: secondChildView)

        secondChildView
            .align(with: parentView, edges: [.top, .bottom, .right])

        childFrameToAssert = .init(x: 0, y: 0, width: width, height: parentFrame.height)

        setLayoutAndCheck()
    }

    func testSpacingToTrailing() {
        let (secondChildView, inset, width) = setAndGetSecondView(isHorizontal: true)

        childView
            .spacingToTrailing(of: secondChildView, constant: inset)
            .align(with: parentView, edges: [.top, .bottom, .right])
            .equalsSize(to: secondChildView)

        secondChildView
            .align(with: parentView, edges: [.top, .bottom, .left])

        childFrameToAssert = .init(x: width + inset, y: 0, width: width, height: parentFrame.height)

        setLayoutAndCheck()
    }

    func testSpacingToBottom() {
        let (secondChildView, inset, height) = setAndGetSecondView(isHorizontal: false)

        childView
            .spacingToBottom(of: secondChildView, constant: inset)
            .align(with: parentView, edges: [.bottom, .left, .right])
            .equalsSize(to: secondChildView)

        secondChildView
            .align(with: parentView, edges: [.top, .left, .right])

        childFrameToAssert = .init(x: 0, y: height + inset, width: parentFrame.width, height: height)

        setLayoutAndCheck()
    }

    func testSpacingToTop() {
        let (secondChildView, inset, height) = setAndGetSecondView(isHorizontal: false)

        childView
            .spacingToTop(of: secondChildView, constant: inset)
            .align(with: parentView, edges: [.top, .left, .right])
            .equalsSize(to: secondChildView)

        secondChildView
            .align(with: parentView, edges: [.bottom, .left, .right])

        childFrameToAssert = .init(x: 0, y: 0, width: parentFrame.width, height: height)

        setLayoutAndCheck()
    }

    // MARK: Helpers

    private func setLayoutAndCheck() {
        parentView.setNeedsLayout()
        parentView.layoutIfNeeded()

        XCTAssertEqual(childView.frame, childFrameToAssert)
    }

    private func setAndGetSecondView(isHorizontal: Bool) -> (secondChildView: UIView, inset: CGFloat, size: CGFloat) {
        let inset = CGFloat(10)
        let secondChildView = UIView()
        parentView.addSubview(secondChildView)

        return (secondChildView, inset, ((isHorizontal ? parentFrame.width : parentFrame.height) - inset) / 2)
    }
}

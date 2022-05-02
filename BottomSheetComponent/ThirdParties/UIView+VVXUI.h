//
//  UIView+VVXUI.h
//  VNPVeXe
//
//  Created by Pham Kien on 21.05.21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (VVXUI)
@property (nonatomic, assign) CGFloat vvx_centerX;
@property (nonatomic, assign) CGFloat vvx_centerY;

@property (nonatomic, assign) CGFloat vvx_x;
@property (nonatomic, assign) CGFloat vvx_xRight;
@property (nonatomic, assign) CGFloat vvx_y;
@property (nonatomic, assign) CGFloat vvx_yBottom;
@property (nonatomic, assign) CGFloat vvx_width;
@property (nonatomic, assign) CGFloat vvx_height;

@property (nonatomic, assign) CGRect vvx_frameFixed;
@property (nonatomic, assign) CGFloat vvx_xFixed;
@property (nonatomic, assign) CGFloat vvx_xRightFixed;
@property (nonatomic, assign) CGFloat vvx_yFixed;
@property (nonatomic, assign) CGFloat vvx_yBottomFixed;
@property (nonatomic, assign) CGFloat vvx_widthFixed;
@property (nonatomic, assign) CGFloat vvx_heightFixed;


- (void)vvx_removeNSHeightConstant;
- (void)bbc_removeNSWidthConstant;
- (void)vvx_setNSWidthConstant:(float)constant;
- (void)vvx_setNSWidthConstant:(float)constant force:(BOOL)force;
- (void)vvx_setNSHeightConstant:(float)constant;
- (void)vvx_setNSHeightConstant:(float)constant force:(BOOL)force;
- (NSLayoutConstraint *)bbc_nsHeight;
- (NSLayoutConstraint *)bbc_nsWidth;
- (NSLayoutConstraint *)vvx_nsLeft;
- (NSLayoutConstraint *)vvx_nsTop;
- (NSLayoutConstraint *)vvx_nsRight;
- (NSLayoutConstraint *)vvx_nsBottom;

// layer
@property (nonatomic, assign) IBInspectable CGFloat vvx_cornerRadius;
@property (nonatomic, assign) IBInspectable CGFloat vvx_borderWidth;
@property (nonatomic, strong) IBInspectable UIColor *vvx_borderColor;

@property (nonatomic, assign) IBInspectable BOOL vvx_localizeView;

- (void)bbc_drawShadow;
- (void)bbc_drawShadowWithColor:(UIColor*)shadowColor size:(CGSize)size opacity:(float)opacity;
- (void)bbc_drawShadowWithColor:(UIColor*)shadowColor size:(CGSize)size opacity:(float)opacity shadowRadius:(CGFloat)shadowRadius;
- (void)bbc_drawShadowWithShadowRadius:(CGFloat)shadowRadius;

- (void)vvx_addNSTop:(float)constant toView:(UIView*)toView;
- (void)vvx_addNSRight:(float)constant toView:(UIView*)toView;
- (void)vvx_addNSBottom:(float)constant toView:(UIView*)toView;
- (void)vvx_addNSLeft:(float)constant toView:(UIView*)toView;

@end

NS_ASSUME_NONNULL_END

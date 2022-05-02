//
//  UIView+VVXUI.m
//  VNPVeXe
//
//  Created by Pham Kien on 21.05.21.
//

#import "UIView+VVXUI.h"

@implementation UIView (VVXUI)
//
//- (void)layoutSubviews {
//    if ([self existFrameFixed]) {
//        self.frame = [self getFrameFixed];
//    }
//}

//static char kAssociatedObjectKey_Localize;
//- (void)setVvx_localizeView:(BOOL)argv {
//    objc_setAssociatedObject(self, &kAssociatedObjectKey_Localize, @(argv), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//- (BOOL)vvx_localizeView {
//    if (objc_getAssociatedObject(self, &kAssociatedObjectKey_Localize) != nil) {
//        return [objc_getAssociatedObject(self, &kAssociatedObjectKey_Localize) boolValue];
//    } else {
//        return YES;
//    }
//}


static char kAssociatedObjectKey_UIViewFrameFixed;

//- (CGRect)getFrameFixed {
//    return [objc_getAssociatedObject(self, &kAssociatedObjectKey_UIViewFrameFixed) CGRectValue];
//}
//
//- (BOOL)existFrameFixed {
//    return objc_getAssociatedObject(self, &kAssociatedObjectKey_UIViewFrameFixed) != nil;
//}
//
//- (void)setVvx_frameFixed:(CGRect)argv {
//    objc_setAssociatedObject(self, &kAssociatedObjectKey_UIViewFrameFixed, @(argv), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//    self.frame = argv;
//    [self setNeedsLayout];
//}

//- (void)setVvx_xFixed:(CGFloat)xFixed {
//    if ([self existFrameFixed]) {
//        CGRect frame = [self getFrameFixed];
//        frame.origin.x = xFixed;
//        [self setVvx_frameFixed:frame];
//    }
//}

//- (CGFloat)getXFixed {
//    if ([self existFrameFixed]) {
//        return [self getFrameFixed].origin.x;
//    } else {
//        return 0;
//    }
//}
//
//- (void)setVvx_xRightFixed:(CGFloat)xRightFixed {
//    if ([self existFrameFixed]) {
//        CGRect frame = [self getFrameFixed];
//        frame.origin.x = xRightFixed - frame.size.width;
//        [self setVvx_frameFixed:frame];
//    }
//}
//
//- (CGFloat)getXRightFixed {
//    if ([self existFrameFixed]) {
//        return [self getFrameFixed].origin.x + [self getFrameFixed].size.width;
//    } else {
//        return 0;
//    }
//}
//
//- (void)setVvx_yFixed:(CGFloat)yFixed {
//    if ([self existFrameFixed]) {
//        CGRect frame = [self getFrameFixed];
//        frame.origin.y = yFixed;
//        [self setVvx_frameFixed:frame];
//    }
//}
//
//- (CGFloat)getYFixed {
//    if ([self existFrameFixed]) {
//        return [self getFrameFixed].origin.y;
//    } else {
//        return 0;
//    }
//}

//- (void)setVvx_yBottomFixed:(CGFloat)yBottomFixed {
//    if ([self existFrameFixed]) {
//        CGRect frame = [self getFrameFixed];
//        frame.origin.y = yBottomFixed - frame.size.height;
//        [self setVvx_frameFixed:frame];
//    }
//}
//
//- (CGFloat)getYBottomFixed {
//    if ([self existFrameFixed]) {
//        return [self getFrameFixed].origin.y + [self getFrameFixed].size.height;
//    } else {
//        return 0;
//    }
//}

//------------

- (CGFloat)vvx_x {
    return self.frame.origin.x;
}

- (CGFloat)vvx_xRight {
    return self.vvx_x + self.vvx_width;
}

- (void)setVvx_xRight:(CGFloat)xRight {
    self.vvx_x = xRight - self.vvx_width;
}

- (CGFloat)vvx_y {
    return self.frame.origin.y;
}

- (CGFloat)vvx_yBottom {
    return self.vvx_y + self.vvx_height;
}

- (void)setVvx_yBottom:(CGFloat)yBottom {
    self.vvx_y = yBottom - self.vvx_height;
}

- (CGFloat)vvx_width {
    return self.frame.size.width;
}

- (CGFloat)vvx_centerX {
    return self.center.x;
}

- (CGFloat)vvx_centerY {
    return self.center.y;
}

- (void)setVvx_centerX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.vvx_centerY);
}

- (void)setVvx_centerY:(CGFloat)centerY{
    self.center = CGPointMake(self.vvx_centerX, centerY);
}

- (CGFloat)vvx_height {
    return self.frame.size.height;
}

- (void)setVvx_x:(CGFloat)x {
    CGRect r = self.frame;
    r.origin.x = x;
    self.frame = r;
}

- (void)setVvx_y:(CGFloat)y {
    CGRect r = self.frame;
    r.origin.y = y;
    self.frame = r;
}

- (void)setVvx_width:(CGFloat)width {
    CGRect r = self.frame;
    r.size.width = width;
    self.frame = r;
}

- (void)setVvx_height:(CGFloat)height {
    CGRect r = self.frame;
    r.size.height = height;
    self.frame = r;
}

- (void)vvx_setNSWidthConstant:(float)constant {
    for (NSLayoutConstraint *constraint in self.constraints) {
        if (constraint.firstAttribute == NSLayoutAttributeWidth) {
            constraint.constant = constant;
        }
    }
}

- (void)bbc_removeNSWidthConstant {
    for (NSLayoutConstraint *constraint in self.constraints) {
        if (constraint.firstAttribute == NSLayoutAttributeWidth) {
            [self removeConstraint:constraint];
        }
    }
}

- (void)vvx_setNSWidthConstant:(float)constant force:(BOOL)force {
    for (NSLayoutConstraint *constraint in self.constraints) {
        if (constraint.firstAttribute == NSLayoutAttributeWidth) {
            constraint.constant = constant;
            if (force) {
                [self removeConstraint:constraint];
            }
        }
    }
    if (force) {
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:1
                                                           constant:constant]];
    }
}

- (void)vvx_setNSHeightConstant:(float)constant {
    [self vvx_setNSHeightConstant:constant force:NO];
}

- (void)vvx_removeNSHeightConstant {
    for (NSLayoutConstraint *constraint in self.constraints) {
        if (constraint.firstAttribute == NSLayoutAttributeHeight) {
            [self removeConstraint:constraint];
        }
    }
}

- (void)vvx_setNSHeightConstant:(float)constant force:(BOOL)force {
    BOOL forceDone = NO;
    for (NSLayoutConstraint *constraint in self.constraints) {
        if (constraint.firstAttribute == NSLayoutAttributeHeight) {
            constraint.constant = constant;
            if (force) {
                [self addConstraint:[NSLayoutConstraint
                                     constraintWithItem:constraint.firstItem
                                     attribute:constraint.firstAttribute
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:constraint.secondItem
                                     attribute:NSLayoutAttributeHeight
                                     multiplier:constraint.multiplier
                                     constant:constraint.constant]];
                [self removeConstraint:constraint];
                forceDone = YES;
            }
        }
    }
    if (force && !forceDone) {
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeHeight
                                                         multiplier:1
                                                           constant:constant]];
    }
}

- (NSLayoutConstraint *)bbc_nsHeight {
    for (NSLayoutConstraint *constraint in self.constraints) {
        if (constraint.firstAttribute == NSLayoutAttributeHeight) {
            return constraint;
        }
    }
    
    return nil;
}

- (NSLayoutConstraint *)bbc_nsWidth {
    for (NSLayoutConstraint *constraint in self.constraints) {
        if (constraint.firstAttribute == NSLayoutAttributeWidth) {
            return constraint;
        }
    }
    
    return nil;
}

- (NSLayoutConstraint *)vvx_nsLeft {
    for (NSLayoutConstraint *constraint in self.superview.constraints) {
        if ((constraint.firstItem == self && constraint.firstAttribute == NSLayoutAttributeLeading)
            || (constraint.secondItem == self && constraint.secondAttribute == NSLayoutAttributeLeading)) {
            return constraint;
        }
    }
    
    return nil;
}

- (NSLayoutConstraint *)vvx_nsTop {
    for (NSLayoutConstraint *constraint in self.superview.constraints) {
        if ((constraint.firstItem == self && constraint.firstAttribute == NSLayoutAttributeTop)
            || (constraint.secondItem == self && constraint.secondAttribute == NSLayoutAttributeTop)) {
            return constraint;
        }
    }
    
    return nil;
}
- (NSLayoutConstraint *)vvx_nsRight {
    for (NSLayoutConstraint *constraint in self.superview.constraints) {
        if ((constraint.firstItem == self && constraint.firstAttribute == NSLayoutAttributeTrailing)
            || (constraint.secondItem == self && constraint.secondAttribute == NSLayoutAttributeTrailing)) {
            return constraint;
        }
    }
    
    return nil;
}
- (NSLayoutConstraint *)vvx_nsBottom {
    for (NSLayoutConstraint *constraint in self.superview.constraints) {
        if ((constraint.firstItem == self && constraint.firstAttribute == NSLayoutAttributeBottom)
            || (constraint.secondItem == self && constraint.secondAttribute == NSLayoutAttributeBottom)) {
            return constraint;
        }
    }
    
    return nil;
}

#pragma mark - LAYER

//- (void)bbc_drawShadow {
//    [self bbc_drawShadowWithColor:colorWithHex(0x000000) size:CGSizeMake(0, 0) opacity:0.05f shadowRadius:self.layer.cornerRadius];
//}
//
//- (void)bbc_drawShadowWithShadowRadius:(CGFloat)shadowRadius {
//    [self bbc_drawShadowWithColor:colorWithHex(0x000000) size:CGSizeMake(0, 0) opacity:0.05f shadowRadius:shadowRadius];
//}

- (void)bbc_drawShadowWithColor:(UIColor*)shadowColor size:(CGSize)size opacity:(float)opacity {
    [self bbc_drawShadowWithColor:shadowColor size:size opacity:opacity shadowRadius:self.layer.shadowRadius];
}

- (void)bbc_drawShadowWithColor:(UIColor*)shadowColor size:(CGSize)size opacity:(float)opacity shadowRadius:(CGFloat)shadowRadius {
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:self.bounds];
    self.layer.masksToBounds = NO;
    self.layer.shadowColor = shadowColor.CGColor;
    self.layer.shadowOffset = size;
    self.layer.shadowOpacity = opacity;
    self.layer.shadowPath = shadowPath.CGPath;
    self.layer.shadowRadius = shadowRadius;
}

-(void)setVvx_cornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius > 0 ? cornerRadius : 0.0f;
    self.layer.masksToBounds = cornerRadius > 0;
}
-(void)setVvx_borderWidth:(CGFloat)borderWidth {
    self.layer.borderWidth = borderWidth > 0 ? borderWidth : 0.0f;
}

-(UIColor*)vvx_borderColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

-(void)setVvx_borderColor:(UIColor *)borderColor {
    self.layer.borderColor = borderColor.CGColor;
}

//+ (instancetype)bbc_initFromNib {
//    id view = [[VVXUIResourses.resourceBundle loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
//    return view;
//}

//- (void)bbc_drawDaslineView {
//
//    int startX = 0;
//    while (true) {
//        UIView *v = [[UIView alloc] initWithFrame:(CGRectMake(startX, 0, 3, 1))];
//        v.backgroundColor = [colorWithHex(0x797984) colorWithAlphaComponent:0.5];
//        [self addSubview:v];
//        startX += v.vvx_width + 3;
//        if (startX>(SCREEN_WIDTH)) {
//            break;
//        }
//    }
//    self.clipsToBounds = TRUE;
//}

- (void)vvx_addNSTop:(float)constant toView:(UIView *)toView {
    NSLayoutConstraint *ns = [NSLayoutConstraint constraintWithItem:self
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:toView
                                                          attribute:toView==self.superview?NSLayoutAttributeTop:NSLayoutAttributeBottom
                                                         multiplier:1
                                                           constant:constant];
    [self.superview addConstraint:ns];
}

- (void)vvx_addNSRight:(float)constant toView:(UIView *)toView {
    NSLayoutConstraint *ns = [NSLayoutConstraint constraintWithItem:toView
                                                          attribute:NSLayoutAttributeTrailing
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self
                                                          attribute:toView==self.superview?NSLayoutAttributeTrailing:NSLayoutAttributeLeading
                                                         multiplier:1
                                                           constant:constant];
    [self.superview addConstraint:ns];
}

- (void)vvx_addNSBottom:(float)constant toView:(UIView *)toView {
    NSLayoutConstraint *ns = [NSLayoutConstraint constraintWithItem:toView
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self
                                                          attribute:toView==self.superview?NSLayoutAttributeBottom:NSLayoutAttributeTop
                                                         multiplier:1
                                                           constant:constant];
    [self.superview addConstraint:ns];
}

- (void)vvx_addNSLeft:(float)constant toView:(UIView *)toView {
    NSLayoutConstraint *ns = [NSLayoutConstraint constraintWithItem:self
                                                          attribute:NSLayoutAttributeLeading
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:toView
                                                          attribute:toView==self.superview?NSLayoutAttributeLeading:NSLayoutAttributeTrailing
                                                         multiplier:1
                                                           constant:constant];
    [self.superview addConstraint:ns];
}

@end

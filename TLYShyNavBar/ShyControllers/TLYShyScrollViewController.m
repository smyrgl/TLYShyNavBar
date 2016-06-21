//
//  TLYShyScrollViewController.m
//  TLYShyNavBarDemo
//
//  Created by Mazyad Alabduljaleel on 11/13/15.
//  Copyright © 2015 Telly, Inc. All rights reserved.
//

#import "TLYShyScrollViewController.h"
#import "../Categories/UIScrollView+Helpers.h"

#import <AsyncDisplayKit/AsyncDisplayKit.h>

@implementation TLYShyScrollViewController

- (void)offsetCenterBy:(CGPoint)deltaPoint
{
    [self updateLayoutIfNeeded];
}

- (CGFloat)updateLayoutIfNeeded
{
    if (self.collectionView.contentSize.height < FLT_EPSILON)
    {
        return 0.f;
    }

    CGFloat parentMaxY = [self.parent maxYRelativeToView:self.collectionView.superview];
    CGFloat normalizedY = parentMaxY - self.collectionView.frame.origin.y;
    UIEdgeInsets insets = UIEdgeInsetsMake(self.collectionView.contentInset.top, 0, self.collectionView.contentInset.bottom, 0);
    insets.top = normalizedY;

    if (normalizedY > -FLT_EPSILON && !UIEdgeInsetsEqualToEdgeInsets(insets, self.collectionView.contentInset))
    {
        CGFloat delta = insets.top - self.collectionView.contentInset.top;

        if (!self.hasCustomRefreshControl && (self.refreshControl == nil || [self.refreshControl isHidden])) {
            [self.collectionView tly_setInsets:insets];
        }

        return delta;
    }

    if (normalizedY < -FLT_EPSILON)
    {
        CGRect frame = self.collectionView.frame;
        frame = UIEdgeInsetsInsetRect(frame, insets);

        self.collectionView.frame = frame;
        return [self updateLayoutIfNeeded];
    }

    return 0.f;
}

@end

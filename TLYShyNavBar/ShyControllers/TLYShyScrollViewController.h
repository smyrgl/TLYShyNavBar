//
//  TLYShyScrollViewController.h
//  TLYShyNavBarDemo
//
//  Created by Mazyad Alabduljaleel on 11/13/15.
//  Copyright © 2015 Telly, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TLYShyViewController.h"
#import "TLYShyParent.h"
#import "TLYShyChild.h"

@class ASCollectionView;

@interface TLYShyScrollViewController : NSObject <TLYShyChild>

@property (nonatomic, weak) ASCollectionView *collectionView;
@property (nonatomic, weak) UIRefreshControl *refreshControl;
@property (nonatomic, weak) TLYShyViewController *parent;

@property (nonatomic, assign) BOOL hasCustomRefreshControl;

- (CGFloat)updateLayoutIfNeeded;

@end

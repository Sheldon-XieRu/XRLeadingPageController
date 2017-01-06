//
//  XRLeadingPageViewController.h
//  XRLeadingPageController
//
//  Created by Ru on 6/1/17.
//  Copyright © 2017年 Ru. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XRLeadingPageCell.h"

typedef void(^XRLeadingPageSetupCellHandler)(XRLeadingPageCell *cell,NSIndexPath *indexPath);
typedef void(^XRLeadingPageFinishHandler)(UIButton *finishBtn);



@interface XRLeadingPageViewController : UIViewController

- (instancetype)initWithPagesCount:(NSInteger)count setupCellHandler:(XRLeadingPageSetupCellHandler)setupCellHandler finishCellHandler:(XRLeadingPageFinishHandler)finishHandler;



@property (nonatomic,strong,readonly) UIPageControl *pageControl;
@property (nonatomic,strong,readonly) UICollectionView *collectionView;
@property (nonatomic,assign,readonly) NSInteger count;



@end

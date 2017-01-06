//
//  XRLeadingPageViewController.m
//  XRLeadingPageController
//
//  Created by Ru on 6/1/17.
//  Copyright © 2017年 Ru. All rights reserved.
//

#import "XRLeadingPageViewController.h"

@interface XRLeadingPageViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,copy) XRLeadingPageSetupCellHandler setupCellHandler;
@property (nonatomic,copy) XRLeadingPageFinishHandler finshHandler;


@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) UIPageControl *pageControl;
@property (nonatomic,assign) NSInteger count;
@end

static NSString *const kXRLeaingPageCellId = @"kXRLeaingPageCellId";

@implementation XRLeadingPageViewController

- (instancetype)initWithPagesCount:(NSInteger)count setupCellHandler:(XRLeadingPageSetupCellHandler)setupCellHandler finishCellHandler:(XRLeadingPageFinishHandler)finishHandler{
    if (self = [super initWithNibName:nil bundle:nil]) {
        _count = count;
        _setupCellHandler = [setupCellHandler copy];
        _finshHandler = [finishHandler copy];
        
        [self.view addSubview:self.collectionView];
        [self.view addSubview:self.pageControl];
        
        [self.collectionView registerClass:[XRLeadingPageCell class] forCellWithReuseIdentifier:kXRLeaingPageCellId];
        
    }
    return self;
}





- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.count;
}




- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    XRLeadingPageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kXRLeaingPageCellId forIndexPath:indexPath];
    if (indexPath.row != self.count - 1) {
        cell.finishBtn.hidden = YES;
    }else{
        cell.finishBtn.hidden = NO;
        [cell.finishBtn addTarget:self action:@selector(finishBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    //设置数据
    if (self.setupCellHandler) {
        self.setupCellHandler(cell,indexPath);
    }
    
    return cell;
    
}


- (void)finishBtnOnClick:(UIButton *)finishBtn{
    if (self.finshHandler) {
        self.finshHandler(finishBtn);
    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSInteger currentPage = scrollView.contentOffset.x/scrollView.bounds.size.width + 0.5;
    if (self.pageControl.currentPage != currentPage) {
        self.pageControl.currentPage = currentPage;
    }
    
}


#pragma mark - getter

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.itemSize = self.view.bounds.size;
        layout.minimumLineSpacing = 0.f;
        layout.minimumInteritemSpacing = 0.f;
        
        UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
        collectionView.pagingEnabled = YES;
        collectionView.bounces = NO;
        collectionView.showsHorizontalScrollIndicator = NO;
        collectionView.delegate = self;
        collectionView.dataSource = self;
        _collectionView = collectionView;
    }
    return _collectionView;
}


- (UIPageControl *)pageControl{
    if (!_pageControl) {
        _pageControl = [UIPageControl new];
        _pageControl.numberOfPages = self.count;
        _pageControl.currentPage = 0;
        _pageControl.userInteractionEnabled = NO;
        CGSize pageControlSize = [_pageControl sizeForNumberOfPages:self.count];
        
        CGFloat pageControlX = (self.view.bounds.size.width - pageControlSize.width)/2;
        CGFloat pageControlY = self.view.bounds.size.height - 100 - pageControlSize.height;
        
        _pageControl.frame = CGRectMake(pageControlX, pageControlY, pageControlSize.width, pageControlSize.height);
    }
    return _pageControl;
}

@end

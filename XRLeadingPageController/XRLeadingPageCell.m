//
//  XRLeadingPageCell.m
//  XRLeadingPageController
//
//  Created by Ru on 6/1/17.
//  Copyright © 2017年 Ru. All rights reserved.
//

#import "XRLeadingPageCell.h"

@implementation XRLeadingPageCell



- (instancetype)init{
    if (self = [super init]) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self commonInit];
    }
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
    }
    return self;
}




- (void)commonInit{
    [self.contentView addSubview:self.imageView];
    [self.contentView addSubview:self.finishBtn];
}


- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.imageView.frame = self.contentView.bounds;
    //根据字数自动调整宽高
    [self.finishBtn sizeToFit];
    
    CGFloat margin = 10.f;
    
    CGFloat btnHeight = self.finishBtn.bounds.size.height + 2*margin;
    CGFloat btnWidth = self.finishBtn.bounds.size.width + 2*margin;
    CGFloat btnX = (self.bounds.size.width - btnWidth)/2;
    
    //距离屏幕下方为100
    CGFloat btnY = self.bounds.size.height - 100 - btnHeight;
    self.finishBtn.frame = CGRectMake(btnX, btnY, btnWidth, btnHeight);
    
    
    
}






- (UIButton *)finishBtn{
    if (!_finishBtn) {
        _finishBtn = [UIButton new];
        _finishBtn.backgroundColor = [UIColor yellowColor];
        _finishBtn.layer.masksToBounds = YES;
        _finishBtn.layer.cornerRadius = 10.f;
    }
    return _finishBtn;
}



- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
        _imageView.contentMode = UIViewContentModeScaleToFill;
    }
    return _imageView;
}

@end

//
//  AspectFitImageView.m
//  WPay
//
//  Created by WeiWei on 2017/11/1.
//  Copyright © 2017年 --. All rights reserved.
//

#import "AspectFitImageView.h"

@implementation AspectFitImageView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.imageWidth = [UIScreen mainScreen].bounds.size.width - 20;
}

- (CGSize)intrinsicContentSize {
    
    CGSize size = [super intrinsicContentSize];
    
    float sacle = self.imageWidth / self.image.size.width;

    size.height = sacle * self.image.size.height;

    return size;
}

@end

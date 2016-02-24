//
//  StarView.m
//  星星
//
//  Created by 谢小御 on 15/12/23.
//  Copyright © 2015年 谢小御. All rights reserved.
//

#import "StarView.h"

@interface StarView ()
{
    CGFloat _starSize;
    NSInteger _maxStar;
    UIColor *_emptyColor;
    UIColor *_fullColor;
}

@end
@implementation StarView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        //默认的星星的大小是 13.0f
        _starSize = 50.0f;
        //未点亮时的颜色是 灰色的
        _emptyColor = [UIColor colorWithRed:167.0f / 255.0f green:167.0f / 255.0f blue:167.0f / 255.0f alpha:1.0f];
        //点亮时的颜色是 亮粉色的`                                                         
        _fullColor = [UIColor colorWithRed:231.0f / 255.0f green:96.0f / 255.0f blue:91.0f / 255.0f alpha:1.0f];
        //默认的长度设置为100
        _maxStar = 100;
    }
    
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // //一个不透明类型的Quartz 2D绘画环境,相当于一个画布,你可以在上面任意绘画
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    NSString* stars = @"★★★★★";
    
    rect = self.bounds;
    UIFont *font = [UIFont boldSystemFontOfSize:_starSize];
    NSDictionary *dict = @{NSFontAttributeName:font};
    CGSize starSize = [stars sizeWithAttributes:dict];
    rect.size=starSize;
    
    NSDictionary *dict1 = @{NSFontAttributeName:font,NSForegroundColorAttributeName:_emptyColor};
    [stars drawInRect:rect withAttributes:dict1];
    
    CGRect clip = rect;
    clip.size.width = clip.size.width * _showStar / _maxStar;
    CGContextClipToRect(context,clip);
    NSDictionary *dict2 = @{NSFontAttributeName:font,NSForegroundColorAttributeName:_fullColor};
    [stars drawInRect:rect withAttributes:dict2];
}


@end

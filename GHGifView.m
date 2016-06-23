//
//  GHGifPlayer.m
//  播放GIF
//
//  Created by GaoHe on 16/6/20.
//  Copyright © 2016年 dyvod. All rights reserved.
//

#import "GHGifView.h"

@interface GHGifView ()

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) CALayer *gifLayer;

@property (nonatomic) BOOL isPlaying;

@end

@implementation GHGifView

- (instancetype)initWithFrame:(CGRect)frame ImageArray:(NSArray *)imageArray{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.frame = frame;
        self.isPlaying = YES;
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        self.imageView.animationImages = imageArray; //动画图片数组
        self.imageView.animationDuration = 1; //执行一次完整动画所需的时长
        self.imageView.animationRepeatCount = -1;  //动画重复次数
        [self addSubview:self.imageView];
        self.gifLayer = _imageView.layer;
        [self.imageView startAnimating];
    }
    return self;
}
-(void)pauseLayer:(CALayer*)layer
{
    CFTimeInterval pausedTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
    layer.speed = 0.0;
    layer.timeOffset = pausedTime;
}

-(void)resumeLayer:(CALayer*)layer
{
    CFTimeInterval pausedTime = [layer timeOffset];
    layer.speed = 1.0;
    layer.timeOffset = 0.0;
    layer.beginTime = 0.0;
    CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] -    pausedTime;
    layer.beginTime = timeSincePause;
}

- (void)gifResume {
    if (!_isPlaying) {
        [self resumeLayer:self.gifLayer];
        self.isPlaying = YES;
    }
}

- (void)gifPause {
    if(_isPlaying) {
        [self pauseLayer:self.gifLayer];
        self.isPlaying = NO;
    }
}

- (void)gifResumePause{
    if (!_isPlaying) {
        [self resumeLayer:self.gifLayer];
        self.isPlaying = YES;
    } else {
        [self pauseLayer:self.gifLayer];
        self.isPlaying = NO;
    }
}
@end

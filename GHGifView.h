//
//  GHGifPlayer.h
//  播放GIF
//
//  Created by GaoHe on 16/6/20.
//  Copyright © 2016年 dyvod. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GHGifView : UIView

- (instancetype)initWithFrame:(CGRect)frame ImageArray:(NSArray *)imageArray;

- (void)gifResume;

- (void)gifPause;

- (void)gifResumePause;

@end

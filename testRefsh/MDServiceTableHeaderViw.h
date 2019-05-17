//
//  MDServiceTableHeaderViw.h
//  mandarinApp
//
//  Created by weiguang on 2019/4/28.
//  Copyright © 2019 PKL. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface MDServiceTableHeaderViw : UIView

@property (weak, nonatomic) IBOutlet UIButton *allTestBtn;


- (instancetype)initHeaderViewWithFrame:(CGRect)frame;


@end

NS_ASSUME_NONNULL_END

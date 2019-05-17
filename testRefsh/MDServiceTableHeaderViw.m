//
//  MDServiceTableHeaderViw.m
//  mandarinApp
//
//  Created by weiguang on 2019/4/28.
//  Copyright © 2019 PKL. All rights reserved.
//

#import "MDServiceTableHeaderViw.h"


@interface MDServiceTableHeaderViw ()
{
    CGRect myFrame; //自身的frame值
}
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *specialServiceLab;

@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *todayLearnTimeLab;
@property (weak, nonatomic) IBOutlet UILabel *learnDaysLab;
@property (weak, nonatomic) IBOutlet UILabel *totalTimeLab;

@property (weak, nonatomic) IBOutlet UILabel *realTestLab;

@property (weak, nonatomic) IBOutlet UIImageView *subHeaderImageView;
@property (weak, nonatomic) IBOutlet UIView *backgroundView;


@end


@implementation MDServiceTableHeaderViw

- (instancetype)initHeaderViewWithFrame:(CGRect)frame{
    
    self = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil].firstObject;
    if (self) {
        self.frame = frame;
        myFrame = frame;
        
        [self initialize];
    }
    
    return self;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)drawRect:(CGRect)rect {
    self.frame = myFrame;
    
   // [self initialize];
}


- (void)layoutSubviews{
    [super layoutSubviews];

   // [UIView addShadowToView:self.backgroundView withOpacity:0.08 shadowRadius:15 shadowColor:[UIColor blackColor] cornerRadius:0];
}

- (void)initialize{
    
//    [self.backgroundView addGradientLayer:[UIColor whiteColor] endColor:UIColorFromRGB(0xfafafa)];
//    [self sendSubviewToBack:self.backgroundView];
    
    self.subHeaderImageView.image = [UIImage imageNamed:@"service_header22"];
    self.subHeaderImageView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor grayColor];

    
    // title
    _specialServiceLab.text = @"特权服务";
//    _specialServiceLab.font = PF_SC_Regular(18);
//    _specialServiceLab.textColor = UIColorHex(0xffe5c6);
    

    
    _nameLab.text = @"霸波儿奔";
//    _nameLab.font = PF_SC_Regular(18);
//    _nameLab.textColor = UIColorHex(0xffe5c6);
    
    _todayLearnTimeLab.text = @"87h";
//    _todayLearnTimeLab.font = KFONT_DP_Bold(29);
//    _todayLearnTimeLab.textColor = UIColorHex(0x333333);
    
    _learnDaysLab.text = @"2d";
//    _learnDaysLab.font = KFONT_DP_Bold(29);
//    _learnDaysLab.textColor = UIColorHex(0x333333);
    
    _totalTimeLab.text = @"13h";
//    _totalTimeLab.font = KFONT_DP_Bold(29);
//    _totalTimeLab.textColor = UIColorHex(0x333333);
    
    // 真题
    _realTestLab.text = @"真题";
    
    
    // 全部
    [_allTestBtn setTitle:@"全部" forState:UIControlStateNormal];
//    [_allTestBtn setTitleColor:UIColorHex(0xff564e) forState:UIControlStateNormal];
//    [_allTestBtn setEnlargeEdge:10];
//    _allTestBtn.titleLabel.font = PF_SC_Light(12);
    
}





@end

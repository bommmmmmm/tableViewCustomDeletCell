//
//  BankCardAddTableViewCell.m
//  PNCMobileBank-bbw
//
//  Created by liuping on 17/5/10.
//  Copyright © 2017年 张瑞. All rights reserved.
//

#import "BankCardAddTableViewCell.h"

@implementation BankCardAddTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
// 用户某一行开始侧滑, 并且侧滑的button还没展示出来时, state的值为UITableViewCellStateShowingDeleteConfirmationMask
// 但是由于侧滑的view 是懒加载的, 这个时候还没创建出来, 所以使用延时加载

/**state
 UITableViewCellStateDefaultMask                     = 0,
 UITableViewCellStateShowingEditControlMask          = 1 << 0,
 UITableViewCellStateShowingDeleteConfirmationMask   = 1 << 1
 *
 */


- (void)willTransitionToState:(UITableViewCellStateMask)state {
    NSLog(@"%s, %d", __FUNCTION__, __LINE__);    
 
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0001 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 是否是iOS 11
        if ((([[[UIDevice currentDevice] systemVersion] floatValue] >= 11.0)?(YES):(NO))) {
            
            for (UIView *subView in self.superview.subviews) {
                if ([NSStringFromClass([subView class]) isEqualToString:@"UISwipeActionPullView"]) {
                    
                    UIView *suView =  (UIView *)(subView.subviews[0].subviews[0]);
                    suView.backgroundColor = [UIColor clearColor];

                    UIButton *view = ((UIButton *)[subView.subviews firstObject]);
                    view.backgroundColor = [UIColor clearColor];
                    view.superview.backgroundColor = [UIColor clearColor];
  
                    NSLog(@"%@", view.subviews[0]);
                    
                    UIView *backImageView = [[UIView alloc] init];
                    // 这一块的frame
                    backImageView.frame = CGRectMake(5, 10, 60, 150 - 20);
                    
                    backImageView.backgroundColor = [UIColor redColor];
                    
                    backImageView.layer.masksToBounds = YES;
                    backImageView.layer.cornerRadius = 10;
                    [view addSubview:backImageView];
                    
                    
                    UIImageView *iamgeView = [[UIImageView alloc] init];
                    [view addSubview:iamgeView];
                    iamgeView.frame = CGRectMake(15, 40, 36, 36);
                    iamgeView.image = [UIImage imageNamed:@"删除cell"];
                    
                    UILabel *label = [[UILabel alloc] init];
                    label.text = view.titleLabel.text;
                    label.frame = CGRectMake(0, 90, 66, 21);
                    [view addSubview:label];
                    
                    
                    label.textColor = [UIColor whiteColor];
                    label.textAlignment = NSTextAlignmentCenter;
                    [view setTitle:@"" forState:(UIControlStateNormal)];

                    
                }
            }
            
        }else {
            for (UIView *subView in self.subviews) {
                
                NSLog(@"%----@%----", NSStringFromClass([subView class]) );
                if ([NSStringFromClass([subView class]) isEqualToString:@"UITableViewCellDeleteConfirmationView"]) {
                    NSLog(@"开始加载啦！！！！！！！！！！！！！！！！！！！！！！！！！！");
                    
                    UIButton *view = ((UIButton *)[subView.subviews firstObject]);
                    view.backgroundColor = [UIColor clearColor];
                    view.superview.backgroundColor = [UIColor clearColor];
                    
                    NSLog(@"%@", view.subviews[0]);
                    
                    UIView *backImageView = [[UIView alloc] init];
                    // 这一块的frame
                    backImageView.frame = CGRectMake(5, 10, 60, 150 - 20);
                    
                    backImageView.backgroundColor = [UIColor redColor];
                    
                    backImageView.layer.masksToBounds = YES;
                    backImageView.layer.cornerRadius = 10;
                    [view addSubview:backImageView];
                    
                    
                    UIImageView *iamgeView = [[UIImageView alloc] init];
                    [view addSubview:iamgeView];
                    iamgeView.frame = CGRectMake(15, 40, 36, 36);
                    iamgeView.image = [UIImage imageNamed:@"删除cell"];
                    
                    UILabel *label = [[UILabel alloc] init];
                    label.text = view.titleLabel.text;
                    label.frame = CGRectMake(0, 90, 66, 21);
                    [view addSubview:label];
                    
                    
                    label.textColor = [UIColor whiteColor];
                    label.textAlignment = NSTextAlignmentCenter;
                    [view setTitle:@"" forState:(UIControlStateNormal)];
                    
                    
                    
                    //                view.titleLabel.frame = CGRectMake(15, 150 - 40, 36, 21.5);
                    //                [view setTitleEdgeInsets:UIEdgeInsetsMake(110, 15, 30, 21)];
                    //
                    //                [view setImage:[UIImage imageNamed:@"灯泡"] forState:(UIControlStateNormal)];
                    //                [view setImageEdgeInsets:UIEdgeInsetsMake(30, 15, 84, 15)];
                    //替换字体
                    //                [view.subviews[0] setValue:@"删1" forKey:@"text"];
                    //                //替换字体颜色
                    //                [view.subviews[0] setValue:[UIColor redColor] forKeyPath:@"textColor"];
                    
                    //也可以直接设置view.layer 但是不会出现边框跟着移动的效果(下图), 这也说明了, UITableViewCellDeleteConfirmationView的frame是跟着你的手指移动在变化的
                    //                view.superview.layer.cornerRadius = 10.0;
                    //                view.superview.layer.borderWidth = 2.0;
                    //                view.superview.layer.borderColor = [UIColor greenColor].CGColor;
                    //                view.superview.layer.masksToBounds = YES;
                    
                    
                }
            }
        }
        
        
       
    });
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

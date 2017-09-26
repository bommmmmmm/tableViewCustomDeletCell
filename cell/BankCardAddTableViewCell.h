//
//  BankCardAddTableViewCell.h
//  PNCMobileBank-bbw
//
//  Created by liuping on 17/5/10.
//  Copyright © 2017年 张瑞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BankCardAddTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *bankNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *bankTypeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *bankImageView;
@property (weak, nonatomic) IBOutlet UIImageView *visaImage;
@property (weak, nonatomic) IBOutlet UILabel *bankCarNumberLabel;
@property (weak, nonatomic) IBOutlet UIView *backgroundViewCustom;

@end

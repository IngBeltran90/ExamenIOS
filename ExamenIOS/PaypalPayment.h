//
//  PaypalPayment.h
//  ExamenIOS
//
//  Created by Philbert on 8/29/16.
//  Copyright © 2016 Philbert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PayPalMobile.h"

@interface PaypalPayment : UIViewController<PayPalPaymentDelegate>
@property NSString *ProductPrice;
@property NSString *ProductName;
@property NSString *ProductImage;
@property (strong, nonatomic) IBOutlet UILabel *lblPrice;
@property (strong, nonatomic) IBOutlet UILabel *lblProductName;
@property (strong, nonatomic) IBOutlet UIButton *btnPayment;
@property (strong, nonatomic) IBOutlet UIImageView *imgProduct;

@end

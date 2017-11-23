//
//  DetailViewController.h
//  Receipts++
//
//  Created by Javier Xing on 2017-11-23.
//  Copyright © 2017 Javier Xing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Receipt+CoreDataClass.h"

@interface DetailViewController : UIViewController

@property (nonatomic, strong) Receipt *receipt;
@property (nonatomic, assign) NSInteger tagIndex;

@end

//
//  DataHandler.h
//  Receipts++
//
//  Created by Javier Xing on 2017-11-23.
//  Copyright © 2017 Javier Xing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Receipt+CoreDataClass.h"
#import "AppDelegate.h"
#import "Tag+CoreDataClass.h"

@interface DataHandler : NSObject

-(NSArray<Tag*>*)fetchTagData;

-(void)addReceiptWithNote:(NSString*)note amount:(NSString*)amount date:(NSDate*)date tags:(NSString*)tags;


@end

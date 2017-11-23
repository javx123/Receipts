//
//  DataHandler.m
//  Receipts++
//
//  Created by Javier Xing on 2017-11-23.
//  Copyright © 2017 Javier Xing. All rights reserved.
//

#import "DataHandler.h"

@implementation DataHandler

-(NSArray<Tag *> *)fetchTagData{
    AppDelegate *appDelegate = ((AppDelegate*)[[UIApplication sharedApplication] delegate]);
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Tag"];
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"tagName" ascending:YES];
    [request setSortDescriptors:@[sort]];
    return [appDelegate.persistentContainer.viewContext executeFetchRequest:request error:nil];
}

-(void)addReceiptWithNote:(NSString *)note amount:(NSString *)amount date:(NSDate *)date tags:(NSString *)tags{
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    Receipt *receipt = [[Receipt alloc]initWithContext: appDelegate.persistentContainer.viewContext];
    NSArray *receipts =  [tags componentsSeparatedByString:@" "];
    NSMutableArray *tagArray = [[NSMutableArray alloc]init];
    
    for (NSString* tagName in receipts) {
        NSFetchRequest *checkRequest = [NSFetchRequest fetchRequestWithEntityName:@"Tag"];
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"tagName == %@", tagName];
        [checkRequest setPredicate:predicate];
        NSArray *fetchResults = [appDelegate.persistentContainer.viewContext executeFetchRequest:checkRequest error:nil];
        Tag *checkerTag = fetchResults.firstObject;
        if ([checkerTag.tagName isEqualToString:tagName]) {
            [tagArray addObject:checkerTag];
        }
        else{
            Tag *tag = [[Tag alloc]initWithContext:appDelegate.persistentContainer.viewContext];
            tag.tagName = tagName;
            [tagArray addObject:tag];
        }
    }
    NSOrderedSet *receiptTags = [NSOrderedSet orderedSetWithArray:tagArray];
    
    receipt.tags = receiptTags;
    
    receipt.note = note;
    receipt.amount = [amount intValue];
    receipt.timeStamp = date;
    
    [appDelegate.persistentContainer.viewContext insertObject:receipt];
    [appDelegate saveContext];
    
}


@end

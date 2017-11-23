//
//  AddReceiptViewController.m
//  Receipts++
//
//  Created by Javier Xing on 2017-11-23.
//  Copyright © 2017 Javier Xing. All rights reserved.
//

#import "AddReceiptViewController.h"
#import "Receipt+CoreDataClass.h"
#import "AppDelegate.h"
#import "Tag+CoreDataClass.h"

@interface AddReceiptViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tagTextField;
@property (weak, nonatomic) IBOutlet UITextField *notesTextField;
@property (weak, nonatomic) IBOutlet UITextField *amountTextField;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation AddReceiptViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender {
    [self.dataHandler addReceiptWithNote:self.notesTextField.text amount:self.amountTextField.text date:self.datePicker.date tags:self.tagTextField.text];
//    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
//
//    Receipt *receipt = [[Receipt alloc]initWithContext: appDelegate.persistentContainer.viewContext];
//    NSArray *receipts =  [self.tagTextField.text componentsSeparatedByString:@" "];
//    NSMutableArray *tagArray = [[NSMutableArray alloc]init];
//
////    Problem with having duplicate tags for certain receipts, fix later
//
//    for (NSString* tagName in receipts) {
//        NSFetchRequest *checkRequest = [NSFetchRequest fetchRequestWithEntityName:@"Tag"];
//        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"tagName == %@", tagName];
//        [checkRequest setPredicate:predicate];
//        NSArray *fetchResults = [appDelegate.persistentContainer.viewContext executeFetchRequest:checkRequest error:nil];
//        Tag *checkerTag = fetchResults.firstObject;
//        if ([checkerTag.tagName isEqualToString:tagName]) {
//            [tagArray addObject:checkerTag];
//        }
//        else{
//            Tag *tag = [[Tag alloc]initWithContext:appDelegate.persistentContainer.viewContext];
//            tag.tagName = tagName;
//            [tagArray addObject:tag];
//        }
//    }
//    NSOrderedSet *tags = [NSOrderedSet orderedSetWithArray:tagArray];
//
//    receipt.tags = tags;
//
//    receipt.note = self.notesTextField.text;
//    receipt.amount = [self.amountTextField.text intValue];
//    receipt.timeStamp = self.datePicker.date;
//
//    [appDelegate.persistentContainer.viewContext insertObject:receipt];
//    [appDelegate saveContext];

    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end

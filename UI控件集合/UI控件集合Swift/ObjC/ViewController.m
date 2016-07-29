//
//  ViewController.m
//  ObjC
//
//  Created by 阳模何 on 16/2/27.
//  Copyright © 2016年 BlueMobi. All rights reserved.
//

#import "ViewController.h"
#import "KlineView.h"
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
#import "CustomCycleview.h"
@interface ViewController ()<ABPeoplePickerNavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet KlineView *lineView;

@property (strong, nonatomic) CustomCycleview *cycView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cycView =[[CustomCycleview alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, (self.view.frame.size.height)/2)];
    [self.view addSubview:self.cycView];
//    [self.lineView fetchData];
    
}
- (void)viewDidAppear:(BOOL)animated{
    [self initImagesView:YES];
}

#pragma mark 创建banner图试图
-(void)initImagesView:(BOOL)isAutomatic{
    
    self.cycView.smallImg = NO;
    [self.cycView setImageUrls:@[@{@"url":@"http://pic.pptbz.com/pptpic/201110/20111014111307895.jpg",@"title":@"1"},@{@"url":@"http://pic14.nipic.com/20110527/7011463_171952275366_2.jpg",@"title":@"2"}]];
    [self.cycView setScrollingSpeed:5.0];
    
    if (isAutomatic) {
        [self.cycView setIsAutoScrolling:true];
        
    }
    else
    {
        [self.cycView setIsAutoScrolling:false];
    }
}

- (void)viewDidAppear_:(BOOL)animated
{
    ABAddressBookRef addressBook = NULL;
    __block BOOL accessGranted = NO;
    
    if (&ABAddressBookRequestAccessWithCompletion != NULL) { // we're on iOS 6
        addressBook = ABAddressBookCreateWithOptions(NULL, NULL);
        dispatch_semaphore_t sema = dispatch_semaphore_create(0);
        ABAddressBookRequestAccessWithCompletion(addressBook, ^(bool granted, CFErrorRef error) {
            accessGranted = granted;
            dispatch_semaphore_signal(sema);
        });
        dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
    }
    else { // we're on iOS 5 or older
        accessGranted = YES;
    }
    
    if (accessGranted) {
        ABPeoplePickerNavigationController *picker = [[ABPeoplePickerNavigationController alloc] init];
        picker.peoplePickerDelegate = self;
        [self.view.window.rootViewController presentViewController:picker animated:YES completion:nil];
    } else {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"你拒绝授权，无法访问通讯录" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alertView show];
    }
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker didSelectPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier {
    ABMultiValueRef phoneNumbers = (ABMultiValueRef)ABRecordCopyValue(person, kABPersonPhoneProperty);
    //    CFRelease(phoneNumbers);
    NSString* phoneNumber = (__bridge NSString*)ABMultiValueCopyValueAtIndex(phoneNumbers, identifier);
    if ([phoneNumber containsString:@"+86"]) {
        phoneNumber = [phoneNumber substringFromIndex:3];
        phoneNumber = [phoneNumber stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    }
    /*_phoneNumberTextField.text*/
    NSString *str = [[[[phoneNumber stringByReplacingOccurrencesOfString:@"-" withString:@""] stringByReplacingOccurrencesOfString:@"(" withString:@""] stringByReplacingOccurrencesOfString:@")" withString:@""] stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSString *givenName = (__bridge NSString *)(ABRecordCopyCompositeName(person));
    NSString *str2  = givenName;
//    _intervieweeTextField.text = givenName;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

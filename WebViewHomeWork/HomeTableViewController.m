//
//  HomeTableViewController.m
//  WebViewHomeWork
//
//  Created by iMac on 29.09.16.
//  Copyright © 2016 hata. All rights reserved.
//

#import "HomeTableViewController.h"

@interface HomeTableViewController ()

@property (strong, nonatomic) NSArray* sections;

@end

@implementation HomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    const NSString* googleUrl = @"http://google.com";
    const NSString* vkUrl = @"http://vk.com";
    const NSString* pdf_1 = @"Objective-C";
    const NSString* pdf_2 = @"Quartz_2D";
    
    NSArray* pdfArray = @[pdf_1, pdf_2];
    NSArray* urlArray = @[googleUrl,vkUrl];
    
    self.sections = @[pdfArray, urlArray];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    cell.textLabel.text = [self.sections[indexPath.section] objectAtIndex:indexPath.row];
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.sections count];
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return section? @"URL":@"PDF";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    NSArray* object = self.sections[section];
    
    return [object count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* identifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
    }
    
    return cell;
}


@end

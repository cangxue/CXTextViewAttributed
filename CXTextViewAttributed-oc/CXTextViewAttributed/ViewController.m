//
//  ViewController.m
//  CXTextViewAttributed
//
//  Created by xiaoma on 17/5/4.
//  Copyright © 2017年 CX. All rights reserved.
//

#import "ViewController.h"
#import "CXLabelViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@property (copy, nonatomic) NSArray *showArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"CXTextViewAttributed";

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.showArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellIdentifier"];
    }
    cell.textLabel.text = _showArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Class  class = NSClassFromString(_showArray[indexPath.row]);
    UIViewController *pushVC = class.new;
    pushVC.title = _showArray[indexPath.row];
    [self.navigationController pushViewController:pushVC animated:YES];
    
//    switch (indexPath.row) {
//        case 0:
//        {
//            CXLabelViewController *labelVC = [[CXLabelViewController alloc] init];
//            labelVC.title = _showArray[indexPath.row];
//            [self.navigationController pushViewController:labelVC animated:YES];
//        }
//            break;
//            
//        default:
//            break;
//    }
}

- (NSArray *)showArray {
    if (_showArray == nil) {
        _showArray = [NSArray arrayWithObjects:@"CXLabelViewController",@"CXTextViewViewController", nil];
    }
    
    return _showArray;
}

@end

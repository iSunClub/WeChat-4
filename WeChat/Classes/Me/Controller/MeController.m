//
//  MeController.m
//  WeChat
//
//  Created by LiDan on 15/10/5.
//  Copyright © 2015年 com.lidan. All rights reserved.
//

#import "MeController.h"
#import "MeMainCell.h"
#import "XMPPvCardTemp.h"
#import "DetailController.h"

@interface MeController ()

@end

@implementation MeController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:SelfColor(240, 239, 244)];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
    
    
-(void)loginOut
{
    [[XmppTools sharedXmppTools] userLogout];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Incomplete implementation, return the number of sections
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete implementation, return the number of rows
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *ID = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if  (indexPath.section == 0)
    {
        cell =[[MeMainCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    else if(indexPath.section == 1)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.textLabel.text = @"退出登录";
        cell.textLabel.textColor = SelfColor(255, 97, 89);
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
    }

    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0)
    {
        XMPPvCardTemp *myVCard = [XmppTools sharedXmppTools].vCard.myvCardTemp;
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageWithData:myVCard.photo]];
        return imageView.image.size.height + 20;
    }
    else
    {
        return 45;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.width,20)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        DetailController *detialVc = [[DetailController alloc] init];
        [self.navigationController pushViewController:detialVc animated:YES];
    }
    else if (indexPath.section == 1)
    {
        [self loginOut];
    }
}

@end

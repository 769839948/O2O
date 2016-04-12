//
//  AddAddressViewController.m
//  O2OProject
//
//  Created by Zhang on 1/31/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "AddAddressViewController.h"
#import "AddressViewModel.h"
#import "ZHPickView.h"

@interface AddAddressViewController ()<UITableViewDelegate, UITableViewDataSource,ZHPickViewDelegate,UIAlertViewDelegate>

{
    ZHPickView *pickerView;
}

@property (nonatomic, strong) UIAlertView *alerView;

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) AddressViewModel *viewModel;


@property (nonatomic, copy) NSMutableArray *tableArray;
@property (nonatomic, copy) NSMutableArray *tableFieldArray;


@end

@implementation AddAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTableView];
    [self setUpNavigationBar];
    // Do any additional setup after loading the view.
}

-(void)setUpNavigationBar
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"放弃" style:UIBarButtonItemStyleDone target:self action:@selector(leftBtPress:)];
}

-(void)setUpTableView
{
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    [self bindViewModel];
}

-(void)bindViewModel
{
    _viewModel = [[AddressViewModel alloc] init];
    _tableArray = [[NSMutableArray alloc] initWithArray:[_viewModel addAddressTableArray]];
    _tableFieldArray = [[NSMutableArray alloc] initWithArray:[_viewModel addAddressField]];
}


-(void)leftBtPress:(UIBarButtonItem *)sender
{
    _alerView = [[UIAlertView alloc] initWithTitle:nil message:@"确定取消新建?"  delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [_alerView show];
    
}


#pragma mark UIAlerViewDelegate
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
        break;
        default:
        {
            [self.navigationController popViewControllerAnimated:YES];
        }
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 懒加载
-(NSMutableArray *)CellArray
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    if (_model.name == nil) {
        [array addObject:@""];
        [array addObject:@""];
        [array addObject:@""];
        [array addObject:@""];
        [array addObject:@""];
        [array addObject:@""];
        [array addObject:@""];
        [array addObject:@""];
        [array addObject:@""];
    }else{
        [array addObject:_model.name];
        [array addObject:_model.phone];
        [array addObject:_model.province];
        [array addObject:_model.city];
        [array addObject:_model.area];
        [array addObject:_model.adress];
        [array addObject:_model.zipcode];
        [array addObject:_model._default];
        [array addObject:_model.adress_id];
    }
    
    return array;
}

#pragma mark - UITableVIewDelegateDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _tableArray.count + 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"AddAdressIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    if (indexPath.row < _tableArray.count) {
        cell.textLabel.text = _tableArray[indexPath.row];
        if (indexPath.row != 5 && indexPath.row != 6) {
            UITextField *userName = [[UITextField alloc] initWithFrame:CGRectMake(100, 5, AppScreenSize.width-120, 40)];
            userName.tag = 100 * indexPath.row;
            userName.placeholder = _tableFieldArray[indexPath.row];
            if (![_model.name isEqualToString:@""]) {
                userName.text = self.CellArray[indexPath.row];
            }
            if (indexPath.row == 2) {
                [userName setEnabled:NO];
            }
            [[userName rac_textSignal] subscribeNext:^(NSString *x) {
                if (indexPath.row == 0) {
                    _model.name = x;
                }else if (indexPath.row == 1){
                    _model.phone = x;
                }else if (indexPath.row == 2){
                    _model.province = x;
                }else if (indexPath.row == 3){
                    _model.city = x;
                }else if (indexPath.row == 4){
                    _model.area = x;
                }else if (indexPath.row == 5){
                    _model.adress = x;
                }else if (indexPath.row == 6){
                    _model.zipcode = x;
                }
            }];
            [cell.contentView addSubview:userName];
        }
    }
    if (indexPath.row == _tableArray.count) {
        UILabel *cellLable = [[UILabel alloc] initWithFrame:cell.frame];
        cellLable.textAlignment = NSTextAlignmentCenter;
        cellLable.textColor = [UIColor whiteColor];
        cellLable.text = @"保存";
        cellLable.backgroundColor = UINavigationBarColor;
        [cell.contentView addSubview:cellLable];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == _tableArray.count) {
        [[_viewModel requestModel:_model] subscribeNext:^(id x) {
            
        }];
    }else if (indexPath.row == 2)
    {
        pickerView=[[ZHPickView alloc] initPickviewWithPlistName:@"city" isHaveNavControler:NO];
        pickerView.delegate = self;
        [pickerView show];

    }
}

#pragma mark - ZHPickViewDelegate

-(void)toobarDonBtnHaveClick:(ZHPickView *)pickView resultString:(NSString *)resultString
{
    UITextField *field = (UITextField *)[self.view viewWithTag:200];
    field.text = resultString;
//    _model.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

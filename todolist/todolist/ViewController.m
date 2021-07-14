//
//  ViewController.m
//  todolist
//
//  Created by jack on 2021/6/15.
//

#import "ViewController.h"
#import "VC2.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     //Do any additional setup after loading the view.
    
    UILabel* label = [[UILabel alloc]initWithFrame:CGRectMake(150,150, 150, 200)];
    label.text = @"Hello World";
    label.textColor = [UIColor redColor];
    label.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:label];
    
//     //创建UItableView，style选择Grouped或Plain，这里我们以Grouped为例
//    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height-20) style:UITableViewStylePlain];
//    // 声明 tableView 的代理和数据源
//    tableView.delegate = self;
//    tableView.dataSource = self;
//    // 添加到 view 上
//    [self.view addSubview:tableView];
    
    UIBarButtonItem* rightBar = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editAction)];
    self.navigationItem.title = @"ToDoLists";
    self.navigationItem.rightBarButtonItem = rightBar;
    
    

//    UIView *redView= [[UIView alloc]initWithFrame:CGRectMake(100, 200, 200, 200)];
//    //修改了redView的bounds
//    redView.bounds = CGRectMake(50, 50, 200, 200);
//    redView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:redView];
//    NSLog(@"redview frame:%@ ---------- bounds:%@",NSStringFromCGRect(redView.frame),NSStringFromCGRect(redView.bounds));
//    UIView *blueSubView= [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
//    blueSubView.backgroundColor = [UIColor blueColor];
//    [redView addSubview:blueSubView];
//    NSLog(@"blueview frame:%@ -------- bounds:%@", NSStringFromCGRect(blueSubView.frame),NSStringFromCGRect(blueSubView.bounds));
    //view1
//    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(50, 50, 100, 100)];
//    view1.backgroundColor = [UIColor grayColor];
//    [self.view addSubview:view1];
//    //view2
//    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
//    view2.backgroundColor = [UIColor redColor];
//    [view1 addSubview:view2];
//    //修改view1的bounds，从而修改view1的本地坐标系，进而影响子视图的位置
//    [UIView animateWithDuration:2 animations:^{
//        [view1 setBounds:CGRectMake(-50, -50, 100, 100)];
//    }];
}
- (void)editAction {
    VC2 *vc = [VC2 new];
    [self.navigationController pushViewController:vc animated:YES];
}
@end

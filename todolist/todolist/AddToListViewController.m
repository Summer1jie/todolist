//
//  AddToListViewController.m
//  todolist
//
//  Created by jack on 2021/6/16.
//

#import "AddToListViewController.h"
#import "VC2.h"
@interface AddToListViewController ()

@property (weak,nonatomic)UIBarButtonItem* doneButton;
@property (weak,nonatomic)UITextField * textfield;

@end

@implementation AddToListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(100, 170, 200, 30)];
    label.textColor = [UIColor blackColor];
    label.text = @"请输入待办事项";
    [self.view addSubview:label];
    UITextField* textfield = [[UITextField alloc] initWithFrame:CGRectMake(100, 200, 200, 30)];
    textfield.borderStyle = UITextBorderStyleRoundedRect;
    textfield.placeholder = @"请在这输入...";
    self.textfield = textfield;
    self.view.backgroundColor = [UIColor systemBackgroundColor];
    [self.view addSubview:self.textfield];
    
    UIBarButtonItem* leftBar = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelAction)];
    UIBarButtonItem* rightBar = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneAction:)];
    self.navigationItem.leftBarButtonItem = leftBar;
    self.navigationItem.rightBarButtonItem = rightBar;
    self.doneButton = rightBar;
    
}

#pragma mark - Navigation
- (void)cancelAction{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)doneAction:(id)sender{
    if(sender!=self.doneButton)return;
    if(self.textfield.text.length>0){
        self.toDoItem = [ToDoListItem new];
        self.toDoItem.itemName = self.textfield.text;
        self.toDoItem.completed = NO;
        VC2* last = [self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count-2];
        last.text = self.toDoItem.itemName;
    }
    [self.navigationController popViewControllerAnimated:YES];
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    //如果未按下就不存储项目，而是让方法返回但不执行任何其他操作。
    if(sender!=self.doneButton)return;
    if(self.textfield.text.length>0){
        //有文字输入
        self.toDoItem = [ToDoListItem new];
        self.toDoItem.itemName = self.textfield.text;
        self.toDoItem.completed = NO;
    }
}

@end

//
//  VC2.m
//  todolist
//
//  Created by jack on 2021/6/16.
//

#import "VC2.h"
#import "AddToListViewController.h"
@interface VC2 ()

@property NSMutableArray * toDoItems;

@end

@implementation VC2

static NSString *CellIdentifier = @"ListPrototypeCell";

- (void) initWithItem:(ToDoListItem* )item{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.toDoItems = [[NSMutableArray alloc]init];
    // 注册cell和设置重用标识符
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
    [self loadInitData];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addAction)];
    
    
    
}
- (void) addAction{
    AddToListViewController* addToItem = [AddToListViewController new];
    [self.navigationController pushViewController:addToItem animated:YES];
}
- (void)loadInitData{
    ToDoListItem * item1 = [[ToDoListItem alloc] init];
    item1.itemName = @"写作业";
    [self.toDoItems addObject:item1];
    
    ToDoListItem * item2 = [[ToDoListItem alloc]init];
    item2.itemName = @"做饭";
    [self.toDoItems addObject:item2];
    
    ToDoListItem * item3 = [[ToDoListItem alloc]init];
    item3.itemName = @"打扫卫生";
    [self.toDoItems addObject:item3];
}
- (void)addData:(NSString *)text{
    if(text.length<=0)return;
    ToDoListItem* item = [[ToDoListItem alloc]init];
    item.itemName = text;
    [self.toDoItems addObject:item];
}
-(void)viewDidAppear:(BOOL)animated{
    [self addData:self.text];
    self.text = nil;
    [self.tableView reloadData];
}
-(IBAction)returnToList:(UIStoryboardSegue *)segue
{
    //获得源控制器
    AddToListViewController* source = [segue sourceViewController];
    ToDoListItem* toDoItem = source.toDoItem;
    if(toDoItem){
        //item不为空
        [self.toDoItems addObject:toDoItem];
        [self.tableView reloadData];
    }
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return [self.toDoItems count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView
    dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    ToDoListItem * toDoItem = [self.toDoItems objectAtIndex:indexPath.row];
    cell.textLabel.text = toDoItem.itemName;
    if(toDoItem.completed){
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/
#pragma mark - Table View delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    ToDoListItem * tappedItem = [self.toDoItems objectAtIndex:indexPath.row];
    //做出了点击动作后
    tappedItem.completed = !tappedItem.completed;
    //更新tableview
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
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

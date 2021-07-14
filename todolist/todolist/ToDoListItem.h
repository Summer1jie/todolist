//
//  ToDoListItem.h
//  todolist
//
//  Created by jack on 2021/6/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//一个表示待办事项的数据结构
@interface ToDoListItem : NSObject

@property  BOOL completed;
@property NSString* itemName;
@property NSDate * creationDate;

@end

NS_ASSUME_NONNULL_END

//
//  ViewController.m
//  PathDemo
//
//  Created by 中企互联 on 17/3/1.
//  Copyright © 2017年 中企互联. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getHomePath {
    
    //    iOS沙盒文件读写
    //1.概念
    //    沙盒是属于应用的一个专属文件夹目录，一个应用无法直接访问别的应用的沙盒目录，这样实际上也是一种隔离的安全机制
    //    Xcode6以后，沙盒的路径变了，但是不管怎么变我们都可以使用代码来找到对应的路径
    
 
    
}
/**
 
 *  获取 沙盒根路径,根路径的子目录是 Document,Library,tmp
 
 */


- (void)homeDir
{
    NSString *homePath = NSHomeDirectory();
    NSLog(@"沙盒根路径是 %@",homePath);
}

/**
 
 *  获取沙盒下的 Ducument目录            == NSHomeDirectory() / Document        ,其他目录类似 ,可以由根目录拼接而成
 
 */

- (void)documentDir
{
    //[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSLog(@"Document目录是: %@",documentsDirectory);
}
/**
 
 *  获取Library路径
 
 */

-(void)libraryDir
{
    //[NSHomeDirectory() stringByAppendingPathComponent:@"Library"];//和下面的语句等价
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *libraryDirectory = [paths objectAtIndex:0];
    NSLog(@"Library目录是: %@",libraryDirectory);
}
/**
 
 *  获取cache目录
 
 */

-(void)cacheDir{
    NSArray *cacPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [cacPath objectAtIndex:0];
    NSLog(@"cache目录是: %@",cachePath);
}

/**
 
 *  获取tmp目录
 
 */

-(void)tmpDir{
    //[NSHomeDirectory() stringByAppendingPathComponent:@"tmp"];
    NSString *tmpDirectory = NSTemporaryDirectory();
    NSLog(@"tmp目录是: %@",tmpDirectory);
}



/**
 
 *  创建文件夹
 
 *  使用NSFileManager来创建删除文件
 
 *  @return
 
 */

//创建文件夹
-(void )createDir{
    NSString *documentsPath = NSHomeDirectory();
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *testDirectory = [documentsPath stringByAppendingPathComponent:@"test"];
    // 创建目录
    BOOL res=[fileManager createDirectoryAtPath:testDirectory withIntermediateDirectories:YES attributes:nil error:nil];
    if (res) {
        NSLog(@"文件夹创建成功");
    }else
        NSLog(@"文件夹创建失败");
}
/**
 
 
 *  创建新文件
 
 *
 
 */
-(void )createFile{
    NSString *documentsPath = NSHomeDirectory();
    NSString *testDirectory = [documentsPath stringByAppendingPathComponent:@"test"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *testPath = [testDirectory stringByAppendingPathComponent:@"test.txt"];
    BOOL res=[fileManager createFileAtPath:testPath contents:nil attributes:nil];
    if (res) {
        NSLog(@"文件创建成功: %@" ,testPath);
    }else
        NSLog(@"文件创建失败");
}
/**
 
 *  写文件
 
 */



-(void)writeFile{
    NSString *documentsPath = NSHomeDirectory();
    NSString *testDirectory = [documentsPath stringByAppendingPathComponent:@"test"];
    NSString *testPath = [testDirectory stringByAppendingPathComponent:@"test.txt"];
    NSString *content=@"测试写入内容！";
    BOOL res=[content writeToFile:testPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    if (res) {
        NSLog(@"文件写入成功");
    }else
        NSLog(@"文件写入失败");
}
/**
 
 *  读取文件
 
 */



-(void)readFile{
    NSString *documentsPath = NSHomeDirectory();
    NSString *testDirectory = [documentsPath stringByAppendingPathComponent:@"test"];
    NSString *testPath = [testDirectory stringByAppendingPathComponent:@"test.txt"];
    //    NSData *data = [NSData dataWithContentsOfFile:testPath];
    //    NSLog(@"文件读取成功: %@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    NSString *content=[NSString stringWithContentsOfFile:testPath encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"文件读取成功: %@",content);
}
/**
 
 *  文件属性
 
 */



-(void)fileAttriutes{
    NSString *documentsPath = NSHomeDirectory();
    NSString *testDirectory = [documentsPath stringByAppendingPathComponent:@"test"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *testPath = [testDirectory stringByAppendingPathComponent:@"test.txt"];
    NSDictionary *fileAttributes = [fileManager attributesOfItemAtPath:testPath error:nil];
    NSArray *keys;
    id key, value;
    keys = [fileAttributes allKeys];
    long count = [keys count];
    for (int i = 0; i < count; i++)
    {
        key = [keys objectAtIndex: i];
        value = [fileAttributes objectForKey: key];
        NSLog (@"Key: %@ for value: %@", key, value);
    }
}
/**
 
 *  删除文件
 
 */


-(void)deleteFile{
    NSString *documentsPath = NSHomeDirectory();
    NSString *testDirectory = [documentsPath stringByAppendingPathComponent:@"test"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *testPath = [testDirectory stringByAppendingPathComponent:@"test.txt"];
    BOOL res=[fileManager removeItemAtPath:testPath error:nil];
    if (res) {
        NSLog(@"文件删除成功");
    }else
        NSLog(@"文件删除失败");
    NSLog(@"文件是否存在: %@",[fileManager isExecutableFileAtPath:testPath]?@"YES":@"NO");
}

@end

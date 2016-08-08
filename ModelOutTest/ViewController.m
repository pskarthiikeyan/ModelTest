//
//  ViewController.m
//  ModelOutTest
//
//  Created by Karthiik PS on 06/08/16.
//  Copyright © 2016 Karthiik PS. All rights reserved.
//

#import "ViewController.h"
#import <DCKeyValueObjectMapping/DCArrayMapping.h>
#import <DCKeyValueObjectMapping/DCParserConfiguration.h>
#import <DCKeyValueObjectMapping/DCKeyValueObjectMapping.h>
#import "User.h"
#import "Tweet.h"



@interface ViewController ()

@end

@implementation ViewController

// "{\"password\" : \"1234\",  \"user\" : \"andreas\"}"

- (void)viewDidLoad {
    
    NSString *jsonStr = @"{\"id_str\": \"27924446\",\"name\": \"Diego Chohfi\",\"screen_name\":\"dchohfi\",\"location\":\"Sao Paulo\",\"description_value\": \"Instrutor na eet, desenvolvedor de coracao, apaixonado por musica e cerveja, sempre cerveja.\",\"url\":\"http://about.me/dchohfi\",\"protected\":false,\"created_at\": \"Tue Mar 31 18:01:12 +0000 2009\",\"tweets\" : [{\"created_at\" : \"Sat Apr 14 00:20:07 +0000 2012\",\"id_str\" : 190957570511478784,\"text\" : \"Tweet text 1\"},{\"created_at\" : \"Sat Apr 14 00:20:07 +0000 2012\",\"id_str\" : 190957570511478784,\"text\" : \"Tweet text 2\"}]}";
            
    //NSLog(@"JSON Str ::%@",jsonStr);
    
    NSData* data = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *error = nil;
    
    NSDictionary *jsonParsed = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];

    
    NSLog(@"Json Data :%@",jsonParsed);
    
    
    DCArrayMapping *mapper = [DCArrayMapping mapperForClassElements:[Tweet class] forAttribute:@"tweets" onClass:[User class]];
    
    DCParserConfiguration *config = [DCParserConfiguration configuration];
    [config addArrayMapper:mapper];
    
    DCKeyValueObjectMapping *parser = [DCKeyValueObjectMapping mapperForClass:[User class]  andConfiguration:config];
                                      
    User *user = [parser parseDictionary:jsonParsed];
    
    NSLog(@"idStr : %@",user.idStr);
    NSLog(@"name : %@",user.name);
    NSLog(@"screenName : %@",user.screenName);
    NSLog(@"location : %@",user.location);
    NSLog(@"description : %@",user.descriptionValue);
    NSLog(@"url : %@",user.url);
    NSLog(@"protected : %d",user.protected);
    NSLog(@"followersCount : %@",user.followersCount);
    NSLog(@"createdAt : %@",user.createdAt);
    NSLog(@"Tweets : %@",user.tweets[0]);
    
   
    
    //committing copy
    //First Commit
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

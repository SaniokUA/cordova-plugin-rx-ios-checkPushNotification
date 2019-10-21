/*
 Licensed to the Apache Software Foundation (ASF) under one
 or more contributor license agreements.  See the NOTICE file
 distributed with this work for additional information
 regarding copyright ownership.  The ASF licenses this file
 to you under the Apache License, Version 2.0 (the
 "License"); you may not use this file except in compliance
 with the License.  You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing,
 software distributed under the License is distributed on an
 "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 KIND, either express or implied.  See the License for the
 specific language governing permissions and limitations
 under the License.
 */
#include <sys/types.h>
#include <sys/sysctl.h>
#import <Cordova/CDV.h>
#import "RXCheckPushNotification.h"
#import "AppDelegate+FCMPlugin.h"


@interface RXCheckPushNotification() {}
@end


@implementation RXCheckPushNotification

static RXCheckPushNotification *rxCheckPushNotificationInstance;

+ (RXCheckPushNotification *) rxCheckPushNotification {
    return rxCheckPushNotificationInstance;
}

- (void)initPluginNotification:(CDVInvokedUrlCommand*)command
{
    rxCheckPushNotificationInstance = self;
    NSLog(@"RUn ios code from js + ");
}

- (void)sendPushNotificationStatus:(NSString*)type
{
    NSString * notifyJS = [NSString stringWithFormat:@"%@('%@');", @"checkPushStatus", type];
    if ([self.webView respondsToSelector:@selector(stringByEvaluatingJavaScriptFromString:)]) {
          [(UIWebView *)self.webView stringByEvaluatingJavaScriptFromString:notifyJS];
    } else {
          [self.webViewEngine evaluateJavaScript:notifyJS completionHandler:nil];
    }
}

@end

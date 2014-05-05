/**
 * print notifications to the console when different apps
 * take focus on OS X
 *
 * Author: Dave Eddy <dave@daveeddy.com>
 * Date: 5/5/14
 * License: MIT
 */

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

#include <unistd.h> // getopt

@interface AppFocus : NSObject
@end
@implementation AppFocus
- (id)init
{
    self = [super init];
    if (!self)
        return self;

    NSNotificationCenter *center = NSWorkspace.sharedWorkspace.notificationCenter;
    [center addObserver:self
               selector:@selector(didActivateApp:)
                   name:NSWorkspaceDidActivateApplicationNotification
                 object:nil];

    return self;
}
- (void)didActivateApp:(NSNotification *)d
{
    NSRunningApplication *app = d.userInfo[NSWorkspaceApplicationKey];
    printf("%s\n", app.localizedName.UTF8String);
}
@end

void print_usage(FILE *stream) {
    fprintf(stream, "usage: app-focus\n");
    fprintf(stream, "\n");
    fprintf(stream, "print notifications to the console when different apps take focus on OS X\n");
    fprintf(stream, "\n");
    fprintf(stream, "options\n");
    fprintf(stream, "  -h              print this message and exit\n");
}

int main(int argc, char **argv) {
    int c;
    while ((c = getopt(argc, argv, "h")) != EOF) {
        switch (c) {
            case 'h': print_usage(stdout); return 0;
            case '?': print_usage(stderr); return 1;
        }
    }

    @autoreleasepool
    {
        NSRunLoop *runLoop = NSRunLoop.currentRunLoop;
        AppFocus *af = [[AppFocus alloc] init];
        while ([runLoop runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:2]]);
    };
    return 0;
}


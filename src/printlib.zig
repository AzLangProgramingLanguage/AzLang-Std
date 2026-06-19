const std = @import("std");

const ValueTag = enum(u8) {
    void = 0,
    int = 1,
    float = 2,
    string = 3,
    bool = 4,
};

const ValueData = extern union {
    int: i64,
    float: f64,
    string: [*:0]const u8,
    bool: u8,
};

const ValueType = extern struct {
    tag: ValueTag,
    data: ValueData,
};

pub export fn printValue(v: *const ValueType) void {
    switch (v.tag) {
        .void => {},
        .int => std.debug.print("{d}\n", .{v.data.int}),
        .float => std.debug.print("{d}\n", .{v.data.float}),
        .string => std.debug.print("{s}\n", .{v.data.string}),
        .bool => {
            if (v.data.bool != 0) {
                std.debug.print("doğru\n", .{});
            } else {
                std.debug.print("yanlış\n", .{});
            }
        },
    }
}

const std = @import("std");

pub export fn inputValue(v: [*:0]const u8) [*:0]const u8 {
    const stdout_buffer: [1024]u8 = undefined;
    return v;
}
test "inputValue" {
    const slice: []const u8 = std.mem.span(inputValue("hello"));

    try std.testing.expectEqualSlices(u8, "hello", slice);
}

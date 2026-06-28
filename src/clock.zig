const std = @import("std");
const Time = std.Io.Timestamp;
pub export fn timeValue(init: std.process.Init) Time {
    return std.Io.Clock.real.now(init.io);
}
test "clockValue" {}

use std::ffi::{CStr, CString};
use std::io;
use std::os::raw::c_char;

#[no_mangle]
pub extern "C" fn inputValue(a: *const c_char) -> *mut c_char {
    if a.is_null() {
        return std::ptr::null_mut();
    }

    let c_str = unsafe { CStr::from_ptr(a) };
    let input_str = c_str.to_string_lossy();

    println!("{}", input_str);

    let mut input = String::new();
    io::stdin()
        .read_line(&mut input)
        .expect("Failed to read line");

    let c_string = CString::new(input).unwrap_or_else(|_| CString::new("").unwrap());
    c_string.into_raw()
}

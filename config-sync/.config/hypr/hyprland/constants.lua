-- Shared constants for all keybind modules.
-- Since every `require()` is a separate Lua scope, shared values live here.
return {
    mainMod        = "SUPER",
    mainModShift   = "SUPER + SHIFT",
    mainModCtrl    = "SUPER + CTRL",
    mainModShiftCtrl = "SUPER + SHIFT + CTRL",
    mainModCtrlAlt = "SUPER + CTRL + ALT",
    alt            = "ALT",
    altShift       = "ALT + SHIFT",

    terminal    = "kitty",
    fileManager = "yazi",
    browser     = "firefox",
}

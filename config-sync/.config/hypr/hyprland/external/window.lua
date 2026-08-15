-- ==============================================================================
-- application window rules
-- ==============================================================================

-- ------------------------
-- file managers
-- ------------------------
hl.window_rule({
    name = "dolphin",
    match = { class = "^(org.kde.dolphin)$" },
    float = true,
    size = {1200, 750},
})

hl.window_rule({
    name = "pcmanfm_nemo",
    match = { class = "^(nemo|Pcmanfm)$" },
    float = true,
})

-- ------------------------
-- input method
-- ------------------------
hl.window_rule({
    name = "fcitx5",
    match = { class = "^(org.fcitx.fcitx5.*)$" },
    float = true,
})

-- ------------------------
-- firefox
-- ------------------------
hl.window_rule({
    name = "firefox",
    match = { class = "^(firefox)$" },
    workspace = "2",
})

hl.window_rule({
    name = "firefox_nightly",
    match = { class = "^(firefox-nightly)$" },
    float = true,
    center = true,
    size = {1600, 950},
})

hl.window_rule({
    name = "firefox_custom",
    match = { title = "^(我的足迹)$" },
    float = true,
})

-- ------------------------
-- image / video
-- ------------------------
hl.window_rule({
    name = "imv",
    match = { class = "^(imv)$" },
    float = true,
    size = {1200, 750},
})

hl.window_rule({
    name = "mpv",
    match = { class = "^(mpv)$" },
    float = true,
})

-- ------------------------
-- launchers
-- ------------------------
hl.window_rule({
    name = "wofi_tofi",
    match = { class = "^(wofi|tofi)$" },
    float = true,
})

-- ------------------------
-- vscode
-- ------------------------
hl.window_rule({
    name = "vscode_main",
    match = { title = "^(Visual Studio Code)$" },
    float = true,
    center = true,
    size = {1200, 750},
})

hl.window_rule({
    name = "vscode_openfolder",
    match = { title = "^(打开文件夹)$" },
    float = true,
    center = true,
    size = {1000, 600},
})

-- ------------------------
-- jetbrains
-- ------------------------
-- from hyprland arch wiki
hl.window_rule({
    name = "xwayuland_conf",
    match = { xwayland = true },
    no_initial_focus = true,
})

hl.window_rule({
    name = "jetbrains_base",
    match = { class = "^jetbrains-" },
    float = true,
})

hl.window_rule({
    name = "jetbrains_toolbox",
    match = { class = "^jetbrains-toolbox$" },
    tile = true,
})

hl.window_rule({
    name = "jetbrains_welcome",
    match = { title = "^Welcome to IntelliJ IDEA$" },
    float = true,
    size = {1200, 750},
})

-- ------------------------
-- zotero
-- ------------------------
hl.window_rule({
    name = "zotero",
    match = { class = "^(Zotero)$" },
    float = true,
    workspace = "3",
})

-- ------------------------
-- QQ chat
-- ------------------------
hl.window_rule({
    name = "qq_main",
    match = { class = "^(QQ)$" },
    workspace = "8",
    float = true,
    center = true,
    size = {1000, 600},
})

hl.window_rule({
    name = "qq_misc",
    match = { title = "^(聊天记录|群公告|QQ频道)$" },
    float = true,
})

-- ------------------------
-- WeChat
-- ------------------------
hl.window_rule({
    name = "wechat_main",
    match = { class = "^(.*wechat.*)$" },
    workspace = "9",
})

hl.window_rule({
    name = "wechat_windows",
    match = {
        class = "^(.*wechat.*)$",
        title = "^(微信|设置|图片查看器|视频播放器|文件管理器|群聊的聊天记录|通讯录管理)$",
    },
    float = true,
    center = true,
    size = {1000, 600},
})

hl.window_rule({
    name = "wechat_setting",
    match = { title = "^(wechat)$" },
    border_size = 0,
    no_blur = true,
    no_shadow = true,
})

-- ------------------------
-- Mission Center
-- ------------------------
hl.window_rule({
    name = "mission_center",
    match = { title = "^(Mission Center)$" },
    float = true,
    center = true,
    size = {1200, 750},
})

-- ------------------------
-- network / audio dialogs
-- ------------------------
hl.window_rule({
    name = "pavucontrol",
    match = { class = "^(.*pavucontrol.*)$" },
    float = true,
    center = true,
    size = {1000, 600},
})

hl.window_rule({
    name = "nm_tools",
    match = { class = "^(nm-applet|nm-connection-editor|blueman-manager|blueman-services)$" },
    float = true,
    center = true,
})

-- ------------------------
-- virt / vm
-- ------------------------
hl.window_rule({
    name = "virt_vm",
    match = { class = "^(virt-manager|qemu|bochs)$" },
    float = true,
})

hl.window_rule({
    name = "qemu_size",
    match = { class = "^(qemu)$" },
    size = {720, 436},
})

-- ------------------------
-- misc dialogs & tools
-- ------------------------
hl.window_rule({
    name = "misc_tools",
    match = { class = "^(listen1|Motrix|rustdesk|Feishu|nwg-look|kvantummanager|qt5ct|thunderbird|showmethekey-gtk|one.alynx.showmethekey|org.nomacs.ImageLounge)$" },
    float = true,
})

hl.window_rule({
    name = "showmethekey_pin",
    match = { class = "^(showmethekey-gtk|org.alynx.showmethekey)$" },
    pin = true,
})

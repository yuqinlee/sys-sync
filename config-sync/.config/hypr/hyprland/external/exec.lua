hl.on("hyprland.start", function()
    -- keepassxc
    -- hl.exec_cmd("keepassxc --minimized")
    hl.exec_cmd("~/.config/.common/script/comm/rclone-connect.sh")

    -- thunderbird
    -- hl.exec_cmd("thunderbird")

    -- syncthing
    hl.exec_cmd("syncthing --no-browser")

    -- gpg 加解密
    -- hl.exec_cmd("kleopatra --daemon")

    -- xwayland scale fix
    hl.exec_cmd("xrdb -merge ~/.Xresources")
end)

local uosc{
    install = local ok, exit_type, code = os.execute("/bin/bash -c \"$(curl -fsSL https://raw.githubusercontent.com/tomasklaen/uosc/HEAD/installers/unix.sh)\"")
}

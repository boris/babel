module AppName
    REVISION = `git log --pretty=format:'%h' -n 1`
    TAG = `git describe --tags`
end

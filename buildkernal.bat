echo 'Building UI'
echo 'Building Kernel'
go version
set GO111MODULE=on
set GOPROXY=https://goproxy.io
set CGO_ENABLED=1

echo 'Building windows Kernel'
set GOOS=windows
set GOARCH=amd64
go build --tags fts5 -v -o "./kernel/esmsh-win64.exe" 

set GOOS=windows
set GOARCH=386
go build --tags fts5 -v -o "./kernel/esmsh-win32.exe"
set CGO_ENABLED=0
set GOOS=darwin
set GOARCH=amd64
go build --tags fts5 -v -o "./kernel-darwin/esmsh" 
set CGO_ENABLED=0
set GOOS=darwin
set GOARCH=arm64
go build --tags fts5 -v -o "./kernel-darwin-arm64/esmsh"
echo 'Building linux Kernel'
set CGO_ENABLED=0
set GOOS=linux
set GOARCH=amd64
go build --tags fts5 -v -o "./kernel-linux/esmsh" 
set GOOS=linux
set GOARCH=arm64
go build --tags fts5 -v -o "./kernel-linux-arm64/esmsh" 





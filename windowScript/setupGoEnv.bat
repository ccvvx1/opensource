set http_proxy=http://localhost:8580
set https_proxy=http://localhost:8580
go env -w GO111MODULE=auto
go env -w GOARCH=386
go env -w GOPATH=U:\backup\files\goIn\go;U:\backup\files\goIn\go\src;
go env -w GOCACHE=U:\Users\Administrator\AppData\Local\go-build
::go env -w GOENV=U:\Users\Administrator\AppData\Roaming\go\env
go env -w GOMODCACHE=U:\Users\Administrator\go\pkg\mod

::go get github.com/PuerkitoBio/goquery
::go get github.com/dgrijalva/jwt-go
::go get github.com/garyburd/redigo/redis
::go get github.com/go-sql-driver/mysql
::go get github.com/gohouse/gorose
::go get github.com/json-iterator/go
::go get github.com/mattn/go-sqlite3
::go get github.com/mohae/deepcopy
::go get github.com/r3labs/sse
::go get github.com/richardlehane/mscfb
::go get github.com/tealeg/xlsx
::go get github.com/xuri/efp
::go get github.com/xuri/excelize
::go get github.com/yuin/gopher-lua
::go get gonum.org/v1/gonum/stat
::go get google.golang.org/grpc
::go get gopkg.in/yaml.v3
::go get go.mongodb.org/mongo-driver/bson

echo "pls del env param:GOPATH manually!"
echo "pls del env param:GOPATH manually!"
echo "pls del env param:GOPATH manually!"
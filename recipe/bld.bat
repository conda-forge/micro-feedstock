@echo on

go build -buildmode=pie -trimpath -o=%LIBRARY_PREFIX%/bin\%PKG_NAME%.exe ^
    -ldflags="-s -w -X github.com/zyedidia/micro/v2/internal/util.Version=%PKG_VERSION%" ^
    .\cmd\micro || goto :error
make test || goto :error

go-licenses save .\cmd\micro\ --save_path=license-files || goto :error

goto :EOF

:error
echo Failed with error #%errorlevel%.
exit 1

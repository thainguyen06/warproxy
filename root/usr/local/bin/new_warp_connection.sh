#!/bin/bash

# Đường dẫn đến file log của proxy server
LOG_FILE="/var/log/wireproxy.log"

# Hàm để ngắt kết nối và kết nối lại Warp
function reset_warp_connection {
    warp-cli disconnect
    warp-cli connect
}

# Theo dõi file log để xác định các kết nối mới
tail -F $LOG_FILE | while read LINE; do
    if echo $LINE | grep -q "New connection"; then
        reset_warp_connection
    fi
done

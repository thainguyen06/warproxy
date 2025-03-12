#!/bin/bash

# Hàm để ngắt kết nối và kết nối lại Warp
function reset_warp_connection {
    warp-cli disconnect
    warp-cli connect
}

# Hàm để kiểm tra các kết nối mới
function check_new_connections {
    netstat -an | grep ESTABLISHED
}

# Theo dõi các kết nối mới
while true; do
    if check_new_connections | grep -q "ESTABLISHED"; then
        reset_warp_connection
    fi
    sleep 5  # Kiểm tra mỗi 5 giây
done

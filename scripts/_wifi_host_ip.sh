#!/bin/bash
ifconfig en0     | # wifiの定義から
grep inet        | # IPにしぼる
grep -v 'inet6'  | # IPv6を除外
awk '{print $2}'   # 2つ目の項目

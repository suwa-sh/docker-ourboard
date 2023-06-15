#!/bin/bash
ifconfig ipsec0  | # IPSECの定義から
grep inet        | # IPにしぼる
grep -v 'inet6'  | # IPv6を除外
awk '{print $2}'   # 2つ目の項目

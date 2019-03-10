#!/bin/bash

mysql -u root -proot isucon <<__
alter table memos add index (is_private);
__

#!/usr/bin/env bash
docker exec -i wpdockerfoundation_mysql_1 bash < build_wp_db.sh
docker exec -i wpdockerfoundation_php_1 bash < wp_cli_commands.sh
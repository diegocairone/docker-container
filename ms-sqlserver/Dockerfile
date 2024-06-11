FROM mcr.microsoft.com/mssql/server:2019-CU18-ubuntu-20.04 AS setup
ENV ACCEPT_EULA Y
ENV SA_PASSWORD=EivRv760 

FROM setup AS data
USER mssql
COPY TESTING_MUTUAL.bak /var/opt/mssql/backup/TESTING_MUTUAL.bak
RUN ( /opt/mssql/bin/sqlservr & ) | grep -q "Service Broker manager has started" \
   && /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "EivRv760" -Q "RESTORE DATABASE TESTING_MUTUAL FROM DISK = '/var/opt/mssql/backup/TESTING_MUTUAL.bak' WITH MOVE 'DESARROLLO_MUTUAL_EIV' TO '/var/opt/mssql/data/TESTING_MUTUAL.mdf', MOVE 'DESARROLLO_MUTUAL_EIV_log' TO '/var/opt/mssql/data/TESTING_MUTUAL_log.ldf'" \
   && pkill sqlservr

FROM setup
COPY --from=data /var/opt/mssql /var/opt/mssql
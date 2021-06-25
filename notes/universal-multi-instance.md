# Multi instance Postgres setup

## Postgres

1) Setup VM with postgres
2) Install docker
```shell
apt update && apt install docker docker.io
```
3) Start postgres
```shell
docker run --name kuma-postgres -e POSTGRES_USER=kuma -e POSTGRES_PASSWORD=kuma -e POSTGRES_DB=kuma -p 5432:5432 -d postgres
```

## CP 1
1) Setup VM
```shell
apt update && apt install tmux
tmux -CC
```

2) Install Kuma
```shell
curl -L https://kuma.io/installer.sh | sh -
```

3) Migrate DB
```shell
KUMA_STORE_TYPE=postgres \
KUMA_STORE_POSTGRES_HOST=65.21.50.154 \
KUMA_STORE_POSTGRES_PORT=5432 \
KUMA_STORE_POSTGRES_USER=kuma \
KUMA_STORE_POSTGRES_PASSWORD=kuma \
KUMA_STORE_POSTGRES_DB_NAME=kuma \
./kuma-cp migrate up
```

3) Install certs for `kumacp` hostname
```shell
echo "-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEAq+7ZJ41l0r2MXHOHvmt+sKHtsvf/WX8VV/vMAM+a1cy4KDZ6
4REQlY5T4RL8fsS+naTI8hfe6IZKqVbcp2vIC3jbqMonxJdagxdz9SegARG00qrw
5DN60gekWXaXKSWhcHGYGZ3FgonU216D3SduPcSWjBcYvKg9Puq/wo2wnCmqCWNe
ZhBYYzdqGMIns/5cD/ZuJtkn7PcvEtUtRp5OPW+H8cuzrcMHL0mzPG2JCfue8j1v
k1yYurhSXOvX++Ll2V+sSs2yteWq/cXO8mSlHDdz4OcUKjWSPa8Ap7dpEP/qlUAe
HYOFBmi5TJFEIWNSkgmAxwMgrRWgfMMACAvOeQIDAQABAoIBADow07RsSesili/w
NiA/t5hGpfGtt/HtbibiJPCdUzVLXYTWs44bPXawvjjuOSEaq70lOZGefKZMVVas
/G95rjIbzJR7HyyNYWf+9xMhPyk9eerXSkKiHc6aIYjZ911IzDQHbkg1OtTsm2tH
uO+P2eLz91QguRGZC2mRACfz1rNzZE5l2xBAcBfA/hvuxiqvx6mvZggnpL6yTgFt
viDA0ksHkXBMid54c3nAgoBVCelRvN+PqeAZZTs1F2YHyBg0pRAu+9x/wF3OSnfB
kJvLSmxtvpqyP9Cg+3EBuP0qlqNF4dssXkGeGc7G12JhQzAkCuuUMj/AVJok7zhx
dIKLuEUCgYEAxtS3e5vir62lDDbDBCmpLRWmNjYz0zpeYZhx0RX3VFw6TyUFFJbs
AONtxGU8tySr5Dma7v4HuLmOishxNPucTSFq4k6dzNM7tjAx3hWqZOeIAybsCDmi
DSAWnQIvyZgtd9WEsEpsZyRSpJ01qGR5jfw0Bg1k2aeMi8EsrZ1uOWcCgYEA3V5D
yeHVG/6DMPzR+eTFl8HCfkdNbsEUrhapZgSBxxCKcySs7abH3BwxeZfeSNNqLhjl
Pb/wdgBUGE+NOn5nPn1lAW+eASyl9bPl24qE7U6d7n/q4fz2Z+1xT2GULqgCRjus
OViQBQY87WU+NLELwbRNR/1ZHgJvqZ/GsUlubR8CgYBrZWSCIM5NxAZdVYr6yaH2
lzYDHD3b/zARmS0JGctRRsu8Civ3Vhm91RpqNaCY7/bkvHTCWHZFQf0LW39CdhGT
29QGzx4PD522J8wXwC4ceK8PvMtLGg489rMgNZkoU8lja/JS4rAw+f6lqcDc5wB9
P9e92Sg7JHQW3M3MLTfnSwKBgQDA8AflTQ+Q9qMhbzkTtHEDc70wkrTKcz6y/M1o
PUVfWutQsAaIm3RWQ7xbXiI/FwTUaJ5k04WhU2f4SF2vPbx+mowOVFpCa8e5/rG4
R2LT8lF0Lclqbi/VJP49Ua71ezmAPUI+ORJNTsKLplIxWp4ElkFFHWsu3LC2BqwG
mRnFwQKBgQC8D/6EK6WM9T1KP9l4LaYUYQZgVXDn+RKPEYUAqa7pWRwzPMiJhc9L
2dq0z9dHlA3gN1EtrOODS1bBLzbXwyzykiDqOdaa7Chj9TZS2+7GMJHdL8e9aCr0
l7VaQDxDT2qzS9tLQR6IJ8u4PryymJY8ER0V4iOtJRmud0c61JRbcA==
-----END RSA PRIVATE KEY-----" > /tmp/key.pem

echo "-----BEGIN CERTIFICATE-----
MIIDKDCCAhCgAwIBAgIRANbRWM09ti/FAF9DP2vbAiUwDQYJKoZIhvcNAQELBQAw
DzENMAsGA1UEAxMEa3VtYTAeFw0yMTAzMDQxMTMwMjNaFw0zMTAzMDIxMTMwMjNa
MA8xDTALBgNVBAMTBGt1bWEwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
AQCr7tknjWXSvYxcc4e+a36woe2y9/9ZfxVX+8wAz5rVzLgoNnrhERCVjlPhEvx+
xL6dpMjyF97ohkqpVtyna8gLeNuoyifEl1qDF3P1J6ABEbTSqvDkM3rSB6RZdpcp
JaFwcZgZncWCidTbXoPdJ249xJaMFxi8qD0+6r/CjbCcKaoJY15mEFhjN2oYwiez
/lwP9m4m2Sfs9y8S1S1Gnk49b4fxy7OtwwcvSbM8bYkJ+57yPW+TXJi6uFJc69f7
4uXZX6xKzbK15ar9xc7yZKUcN3Pg5xQqNZI9rwCnt2kQ/+qVQB4dg4UGaLlMkUQh
Y1KSCYDHAyCtFaB8wwAIC855AgMBAAGjfzB9MA4GA1UdDwEB/wQEAwICpDAdBgNV
HSUEFjAUBggrBgEFBQcDAQYIKwYBBQUHAwEwDwYDVR0TAQH/BAUwAwEB/zAdBgNV
HQ4EFgQUp3O1auzjr0wcGI8/vO5+jNyeYVgwHAYDVR0RBBUwE4IGa3VtYWNwggls
b2NhbGhvc3QwDQYJKoZIhvcNAQELBQADggEBABVFlO09mR63GeHy00oApqBFv6O7
h6u2dEe4L4CLXt7yPqAy19v3xc1CzL62GwQ8wELweKU0/jcvFpre1UG5K8miKfWW
Ll/pO6mg6VPuLp3OUYWDnvWrc+t/CciwJRQdu6vDJ0Z+QnUPRsmIGE427LmJNH9U
0US4xM0HoyNeXVKSsJIbJfb+EE9lvSMxDtjT2Ug0LqiwisTo7MBmZ+di1K8zEf2h
KdpSAIPzqOIbgaMdEY3EGeJmFuTpHgEcktSqLqQe5/PP4rpM0wV2CvFpVKxXeeJa
BWQJdGQQRnR2hBdrPWwsnB8OvS3H/acG+JpOuawmxs2+gYZxxbm9beSvmMA=
-----END CERTIFICATE-----" > /tmp/cert.pem
```

4) Run Kuma CP
```shell
KUMA_STORE_TYPE=postgres \
KUMA_STORE_POSTGRES_HOST=65.21.50.154 \
KUMA_STORE_POSTGRES_PORT=5432 \
KUMA_STORE_POSTGRES_USER=kuma \
KUMA_STORE_POSTGRES_PASSWORD=kuma \
KUMA_STORE_POSTGRES_DB_NAME=kuma \
KUMA_GENERAL_TLS_CERT_FILE=/tmp/cert.pem \
KUMA_GENERAL_TLS_KEY_FILE=/tmp/key.pem \
KUMA_DP_SERVER_HDS_ENABLED=false \
./kuma-cp run
```

## CP 2

1) Setup VM
```shell
apt update && apt install tmux
tmux -CC
```

2) Install Kuma
```shell
curl -L https://kuma.io/installer.sh | sh -
```

3) Install certs for `kumacp` hostname
```shell
echo "-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEAq+7ZJ41l0r2MXHOHvmt+sKHtsvf/WX8VV/vMAM+a1cy4KDZ6
4REQlY5T4RL8fsS+naTI8hfe6IZKqVbcp2vIC3jbqMonxJdagxdz9SegARG00qrw
5DN60gekWXaXKSWhcHGYGZ3FgonU216D3SduPcSWjBcYvKg9Puq/wo2wnCmqCWNe
ZhBYYzdqGMIns/5cD/ZuJtkn7PcvEtUtRp5OPW+H8cuzrcMHL0mzPG2JCfue8j1v
k1yYurhSXOvX++Ll2V+sSs2yteWq/cXO8mSlHDdz4OcUKjWSPa8Ap7dpEP/qlUAe
HYOFBmi5TJFEIWNSkgmAxwMgrRWgfMMACAvOeQIDAQABAoIBADow07RsSesili/w
NiA/t5hGpfGtt/HtbibiJPCdUzVLXYTWs44bPXawvjjuOSEaq70lOZGefKZMVVas
/G95rjIbzJR7HyyNYWf+9xMhPyk9eerXSkKiHc6aIYjZ911IzDQHbkg1OtTsm2tH
uO+P2eLz91QguRGZC2mRACfz1rNzZE5l2xBAcBfA/hvuxiqvx6mvZggnpL6yTgFt
viDA0ksHkXBMid54c3nAgoBVCelRvN+PqeAZZTs1F2YHyBg0pRAu+9x/wF3OSnfB
kJvLSmxtvpqyP9Cg+3EBuP0qlqNF4dssXkGeGc7G12JhQzAkCuuUMj/AVJok7zhx
dIKLuEUCgYEAxtS3e5vir62lDDbDBCmpLRWmNjYz0zpeYZhx0RX3VFw6TyUFFJbs
AONtxGU8tySr5Dma7v4HuLmOishxNPucTSFq4k6dzNM7tjAx3hWqZOeIAybsCDmi
DSAWnQIvyZgtd9WEsEpsZyRSpJ01qGR5jfw0Bg1k2aeMi8EsrZ1uOWcCgYEA3V5D
yeHVG/6DMPzR+eTFl8HCfkdNbsEUrhapZgSBxxCKcySs7abH3BwxeZfeSNNqLhjl
Pb/wdgBUGE+NOn5nPn1lAW+eASyl9bPl24qE7U6d7n/q4fz2Z+1xT2GULqgCRjus
OViQBQY87WU+NLELwbRNR/1ZHgJvqZ/GsUlubR8CgYBrZWSCIM5NxAZdVYr6yaH2
lzYDHD3b/zARmS0JGctRRsu8Civ3Vhm91RpqNaCY7/bkvHTCWHZFQf0LW39CdhGT
29QGzx4PD522J8wXwC4ceK8PvMtLGg489rMgNZkoU8lja/JS4rAw+f6lqcDc5wB9
P9e92Sg7JHQW3M3MLTfnSwKBgQDA8AflTQ+Q9qMhbzkTtHEDc70wkrTKcz6y/M1o
PUVfWutQsAaIm3RWQ7xbXiI/FwTUaJ5k04WhU2f4SF2vPbx+mowOVFpCa8e5/rG4
R2LT8lF0Lclqbi/VJP49Ua71ezmAPUI+ORJNTsKLplIxWp4ElkFFHWsu3LC2BqwG
mRnFwQKBgQC8D/6EK6WM9T1KP9l4LaYUYQZgVXDn+RKPEYUAqa7pWRwzPMiJhc9L
2dq0z9dHlA3gN1EtrOODS1bBLzbXwyzykiDqOdaa7Chj9TZS2+7GMJHdL8e9aCr0
l7VaQDxDT2qzS9tLQR6IJ8u4PryymJY8ER0V4iOtJRmud0c61JRbcA==
-----END RSA PRIVATE KEY-----" > /tmp/key.pem

echo "-----BEGIN CERTIFICATE-----
MIIDKDCCAhCgAwIBAgIRANbRWM09ti/FAF9DP2vbAiUwDQYJKoZIhvcNAQELBQAw
DzENMAsGA1UEAxMEa3VtYTAeFw0yMTAzMDQxMTMwMjNaFw0zMTAzMDIxMTMwMjNa
MA8xDTALBgNVBAMTBGt1bWEwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
AQCr7tknjWXSvYxcc4e+a36woe2y9/9ZfxVX+8wAz5rVzLgoNnrhERCVjlPhEvx+
xL6dpMjyF97ohkqpVtyna8gLeNuoyifEl1qDF3P1J6ABEbTSqvDkM3rSB6RZdpcp
JaFwcZgZncWCidTbXoPdJ249xJaMFxi8qD0+6r/CjbCcKaoJY15mEFhjN2oYwiez
/lwP9m4m2Sfs9y8S1S1Gnk49b4fxy7OtwwcvSbM8bYkJ+57yPW+TXJi6uFJc69f7
4uXZX6xKzbK15ar9xc7yZKUcN3Pg5xQqNZI9rwCnt2kQ/+qVQB4dg4UGaLlMkUQh
Y1KSCYDHAyCtFaB8wwAIC855AgMBAAGjfzB9MA4GA1UdDwEB/wQEAwICpDAdBgNV
HSUEFjAUBggrBgEFBQcDAQYIKwYBBQUHAwEwDwYDVR0TAQH/BAUwAwEB/zAdBgNV
HQ4EFgQUp3O1auzjr0wcGI8/vO5+jNyeYVgwHAYDVR0RBBUwE4IGa3VtYWNwggls
b2NhbGhvc3QwDQYJKoZIhvcNAQELBQADggEBABVFlO09mR63GeHy00oApqBFv6O7
h6u2dEe4L4CLXt7yPqAy19v3xc1CzL62GwQ8wELweKU0/jcvFpre1UG5K8miKfWW
Ll/pO6mg6VPuLp3OUYWDnvWrc+t/CciwJRQdu6vDJ0Z+QnUPRsmIGE427LmJNH9U
0US4xM0HoyNeXVKSsJIbJfb+EE9lvSMxDtjT2Ug0LqiwisTo7MBmZ+di1K8zEf2h
KdpSAIPzqOIbgaMdEY3EGeJmFuTpHgEcktSqLqQe5/PP4rpM0wV2CvFpVKxXeeJa
BWQJdGQQRnR2hBdrPWwsnB8OvS3H/acG+JpOuawmxs2+gYZxxbm9beSvmMA=
-----END CERTIFICATE-----" > /tmp/cert.pem
```

4) Run Kuma CP
```shell
KUMA_STORE_TYPE=postgres \
KUMA_STORE_POSTGRES_HOST=65.21.50.154 \
KUMA_STORE_POSTGRES_PORT=5432 \
KUMA_STORE_POSTGRES_USER=kuma \
KUMA_STORE_POSTGRES_PASSWORD=kuma \
KUMA_STORE_POSTGRES_DB_NAME=kuma \
KUMA_GENERAL_TLS_CERT_FILE=/tmp/cert.pem \
KUMA_GENERAL_TLS_KEY_FILE=/tmp/key.pem \
./kuma-cp run
```

## Web DP

1) Setup VM
```shell
apt update && apt install tmux
tmux -CC
```

2) Adjust /etc/hosts
```shell
echo "65.21.0.83 kumacp" >> /etc/hosts
echo "65.21.48.56 kumacp" >> /etc/hosts
```

3) Install Kuma
```shell
curl -L https://kuma.io/installer.sh | sh -
```

4) Configure Kuma
```shell
echo "
type: Dataplane
mesh: default
name: web-1
networking:
  address: {{ address }}
  gateway:
    tags:
      kuma.io/service: web
" > /tmp/dp.yaml
```

Bring the token
(on the CP machine)
```shell
./kumactl generate dataplane-token --name=web-1
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJOYW1lIjoid2ViLTEiLCJNZXNoIjoiZGVmYXVsdCIsIlRhZ3MiOnt9LCJUeXBlIjoiIn0.C_8DnZ6oW_3E8v4BxqfJ8BTrKOiIN4lSiXI5CqhcfXs
```
(on the DP machine)
```shell
printf "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJOYW1lIjoid2ViLTEiLCJNZXNoIjoiZGVmYXVsdCIsIlRhZ3MiOnt9LCJUeXBlIjoiIn0.C_8DnZ6oW_3E8v4BxqfJ8BTrKOiIN4lSiXI5CqhcfXs" > /tmp/kuma-dp-token
```

5) Run Kuma DP
```shell
./kuma-dp run \
  --cp-address=https://kumacp:5678 \
  --dataplane-file=/tmp/dp.yaml \
  --dataplane-token-file=/tmp/kuma-dp-token \
  --dataplane-var address=$(ip addr show | grep 'inet ' | awk '{print $2}' | cut -f1 -d'/' | grep 10.0.0)
```




## Autogenerate certs
```shell
./kumactl generate tls-certificate --cp-hostname=kumacp --cert-file=/tmp/cert.pem --key-file=/tmp/key.pem --type=server

cat /tmp/key.pem
-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEAq+7ZJ41l0r2MXHOHvmt+sKHtsvf/WX8VV/vMAM+a1cy4KDZ6
4REQlY5T4RL8fsS+naTI8hfe6IZKqVbcp2vIC3jbqMonxJdagxdz9SegARG00qrw
5DN60gekWXaXKSWhcHGYGZ3FgonU216D3SduPcSWjBcYvKg9Puq/wo2wnCmqCWNe
ZhBYYzdqGMIns/5cD/ZuJtkn7PcvEtUtRp5OPW+H8cuzrcMHL0mzPG2JCfue8j1v
k1yYurhSXOvX++Ll2V+sSs2yteWq/cXO8mSlHDdz4OcUKjWSPa8Ap7dpEP/qlUAe
HYOFBmi5TJFEIWNSkgmAxwMgrRWgfMMACAvOeQIDAQABAoIBADow07RsSesili/w
NiA/t5hGpfGtt/HtbibiJPCdUzVLXYTWs44bPXawvjjuOSEaq70lOZGefKZMVVas
/G95rjIbzJR7HyyNYWf+9xMhPyk9eerXSkKiHc6aIYjZ911IzDQHbkg1OtTsm2tH
uO+P2eLz91QguRGZC2mRACfz1rNzZE5l2xBAcBfA/hvuxiqvx6mvZggnpL6yTgFt
viDA0ksHkXBMid54c3nAgoBVCelRvN+PqeAZZTs1F2YHyBg0pRAu+9x/wF3OSnfB
kJvLSmxtvpqyP9Cg+3EBuP0qlqNF4dssXkGeGc7G12JhQzAkCuuUMj/AVJok7zhx
dIKLuEUCgYEAxtS3e5vir62lDDbDBCmpLRWmNjYz0zpeYZhx0RX3VFw6TyUFFJbs
AONtxGU8tySr5Dma7v4HuLmOishxNPucTSFq4k6dzNM7tjAx3hWqZOeIAybsCDmi
DSAWnQIvyZgtd9WEsEpsZyRSpJ01qGR5jfw0Bg1k2aeMi8EsrZ1uOWcCgYEA3V5D
yeHVG/6DMPzR+eTFl8HCfkdNbsEUrhapZgSBxxCKcySs7abH3BwxeZfeSNNqLhjl
Pb/wdgBUGE+NOn5nPn1lAW+eASyl9bPl24qE7U6d7n/q4fz2Z+1xT2GULqgCRjus
OViQBQY87WU+NLELwbRNR/1ZHgJvqZ/GsUlubR8CgYBrZWSCIM5NxAZdVYr6yaH2
lzYDHD3b/zARmS0JGctRRsu8Civ3Vhm91RpqNaCY7/bkvHTCWHZFQf0LW39CdhGT
29QGzx4PD522J8wXwC4ceK8PvMtLGg489rMgNZkoU8lja/JS4rAw+f6lqcDc5wB9
P9e92Sg7JHQW3M3MLTfnSwKBgQDA8AflTQ+Q9qMhbzkTtHEDc70wkrTKcz6y/M1o
PUVfWutQsAaIm3RWQ7xbXiI/FwTUaJ5k04WhU2f4SF2vPbx+mowOVFpCa8e5/rG4
R2LT8lF0Lclqbi/VJP49Ua71ezmAPUI+ORJNTsKLplIxWp4ElkFFHWsu3LC2BqwG
mRnFwQKBgQC8D/6EK6WM9T1KP9l4LaYUYQZgVXDn+RKPEYUAqa7pWRwzPMiJhc9L
2dq0z9dHlA3gN1EtrOODS1bBLzbXwyzykiDqOdaa7Chj9TZS2+7GMJHdL8e9aCr0
l7VaQDxDT2qzS9tLQR6IJ8u4PryymJY8ER0V4iOtJRmud0c61JRbcA==
-----END RSA PRIVATE KEY-----

cat /tmp/cert.pem
-----BEGIN CERTIFICATE-----
MIIDKDCCAhCgAwIBAgIRANbRWM09ti/FAF9DP2vbAiUwDQYJKoZIhvcNAQELBQAw
DzENMAsGA1UEAxMEa3VtYTAeFw0yMTAzMDQxMTMwMjNaFw0zMTAzMDIxMTMwMjNa
MA8xDTALBgNVBAMTBGt1bWEwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
AQCr7tknjWXSvYxcc4e+a36woe2y9/9ZfxVX+8wAz5rVzLgoNnrhERCVjlPhEvx+
xL6dpMjyF97ohkqpVtyna8gLeNuoyifEl1qDF3P1J6ABEbTSqvDkM3rSB6RZdpcp
JaFwcZgZncWCidTbXoPdJ249xJaMFxi8qD0+6r/CjbCcKaoJY15mEFhjN2oYwiez
/lwP9m4m2Sfs9y8S1S1Gnk49b4fxy7OtwwcvSbM8bYkJ+57yPW+TXJi6uFJc69f7
4uXZX6xKzbK15ar9xc7yZKUcN3Pg5xQqNZI9rwCnt2kQ/+qVQB4dg4UGaLlMkUQh
Y1KSCYDHAyCtFaB8wwAIC855AgMBAAGjfzB9MA4GA1UdDwEB/wQEAwICpDAdBgNV
HSUEFjAUBggrBgEFBQcDAQYIKwYBBQUHAwEwDwYDVR0TAQH/BAUwAwEB/zAdBgNV
HQ4EFgQUp3O1auzjr0wcGI8/vO5+jNyeYVgwHAYDVR0RBBUwE4IGa3VtYWNwggls
b2NhbGhvc3QwDQYJKoZIhvcNAQELBQADggEBABVFlO09mR63GeHy00oApqBFv6O7
h6u2dEe4L4CLXt7yPqAy19v3xc1CzL62GwQ8wELweKU0/jcvFpre1UG5K8miKfWW
Ll/pO6mg6VPuLp3OUYWDnvWrc+t/CciwJRQdu6vDJ0Z+QnUPRsmIGE427LmJNH9U
0US4xM0HoyNeXVKSsJIbJfb+EE9lvSMxDtjT2Ug0LqiwisTo7MBmZ+di1K8zEf2h
KdpSAIPzqOIbgaMdEY3EGeJmFuTpHgEcktSqLqQe5/PP4rpM0wV2CvFpVKxXeeJa
BWQJdGQQRnR2hBdrPWwsnB8OvS3H/acG+JpOuawmxs2+gYZxxbm9beSvmMA=
-----END CERTIFICATE-----
```

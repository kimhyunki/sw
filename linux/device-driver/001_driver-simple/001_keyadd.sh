cat >>/tmp/x509.conf <<EOF
[ req ]
default_bits = 4096
distinguished_name = req_distinguished_name
prompt = no
string_mask = utf8only
x509_extensions = extensions

[ req_distinguished_name ]
O = khkraining, Inc.
CN = simple
emailAddress = khkraining@gmail.com

[ extensions ]
basicConstraints=critical,CA:FALSE
keyUsage=digitalSignature
subjectKeyIdentifier=hash
authorityKeyIdentifier=keyid
EOF

sudo openssl req -x509 -new -nodes -utf8 -sha256 -days 99999 -batch -config /tmp/x509.conf -outform DER -out pubkey.der -keyout priv.key

sudo mokutil --import pubkey.der

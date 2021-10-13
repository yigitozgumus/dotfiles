function get_sha256_from_key --argument key
openssl x509 -in $key -pubkey -noout | openssl pkey -pubin -outform der | openssl dgst -sha256 -binary | openssl enc -base64
end

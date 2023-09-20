# my personal setup files for my fedora installations

```
./install.sh
```


# Renew GnuPG Keys

Renew all 3 subkeys. Restore Master Key from encrypted backup

```
gpg --edit-key info@gitcd.io

	# delete 3 subkeys
	key 1
	delkey

	key 1
	delkey

	key 1
	delkey


	#add new keys again, 1y ttl please
	# copy the master key password from the password manager before "Wirklich erzeugen? (j/N)"
	# (4) RSA (signing) / 4096 bit / 1y
	addkey

	# (4) RSA (encryption) / 4096 bit / 1y
	addkey

	# (4) RSA (authentication) / 4096 bit / 1y
	addkey


	key 1
	# choose slot according to capability
	# copy Yubikey PGP Admin PIN before "Vorhandenen Schlüssel ersetzen? (j/N)"
	keytocard

```

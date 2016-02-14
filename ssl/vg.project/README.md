##To create SSL certificate
	~$ openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout apache.key -out apache.crt
	
	You are about to be asked to enter information that will be incorporated
	into your certificate request.
	What you are about to enter is what is called a Distinguished Name or a DN.
	There are quite a few fields but you can leave some blank
	For some fields there will be a default value,
	If you enter '.', the field will be left blank.
	-----
	Country Name (2 letter code) [AU]:US
	State or Province Name (full name) [Some-State]:NY
	Locality Name (eg, city) []:NYC
	Organization Name (eg, company) [Internet Widgits Pty Ltd]:My Dev
	Organizational Unit Name (eg, section) []:Dev
	Common Name (e.g. server FQDN or YOUR name) []:vg.project
	Email Address []:vg.project@gmail.com

##To review certificate details
	~$ openssl x509 -in apache.crt -text -noout

	Certificate:
		Data:
			Version: 3 (0x2)
			Serial Number:
				e4:8c:71:7b:ce:8e:d1:1e
		Signature Algorithm: sha256WithRSAEncryption
			Issuer: C=US, ST=NY, L=NYC, O=My Dev, OU=Dev, CN=vg.project/emailAddress=vg.project@gmail.com
			Validity
				Not Before: Jan 17 20:23:17 2016 GMT
				Not After : Jan 14 20:23:17 2026 GMT
			Subject: C=US, ST=NY, L=NYC, O=My Dev, OU=Dev, CN=vg.project/emailAddress=vg.project@gmail.com
			Subject Public Key Info:
				Public Key Algorithm: rsaEncryption
					Public-Key: (2048 bit)
					Modulus:
						00:b2:45:91:51:74:07:f6:ab:28:37:3e:d7:07:bc:
						9f:75:5e:38:b9:29:1d:b9:9f:a4:5e:e8:89:8a:43:
						48:f7:b9:5b:47:91:ab:33:e3:29:11:72:17:74:a8:
						8a:99:65:57:3c:51:a6:e5:7a:ca:89:a7:b3:1d:59:
						81:2e:3e:8c:d6:49:64:ea:df:a7:69:6e:d4:26:b9:
						07:8b:bb:a1:dd:2f:7b:c8:04:1d:34:33:53:00:b7:
						f9:1e:95:b2:fa:a6:a2:04:36:d1:70:de:cd:b4:5f:
						50:10:d4:f9:35:ec:55:45:ce:fb:c6:19:2a:bd:c8:
						ff:b3:6b:76:d8:82:05:75:6d:bd:03:6f:0f:b8:9a:
						cd:01:f4:0d:2a:a0:22:73:c3:c4:85:0b:9f:32:82:
						44:0c:3a:96:42:1b:3f:de:e1:c1:42:0f:f9:ca:91:
						10:4c:4c:41:62:1a:71:3c:e5:ee:7f:71:06:65:22:
						51:c4:e3:d7:a6:e0:5c:03:72:f1:ae:32:ba:d3:fc:
						15:d5:30:41:9d:95:22:67:9c:2d:b0:8d:30:a1:09:
						f2:fb:5e:0d:9f:52:48:b5:93:53:4c:dd:7f:15:9d:
						6d:ef:91:43:81:df:e6:42:f8:bb:51:ae:f6:4c:8e:
						8b:92:a1:2a:f8:7e:c1:f5:f4:8c:33:66:49:a5:06:
						af:a3
					Exponent: 65537 (0x10001)
			X509v3 extensions:
				X509v3 Subject Key Identifier:
					53:39:84:03:F5:39:77:BE:8C:51:57:F6:41:79:39:D8:40:75:5B:D8
				X509v3 Authority Key Identifier:
					keyid:53:39:84:03:F5:39:77:BE:8C:51:57:F6:41:79:39:D8:40:75:5B:D8
	
				X509v3 Basic Constraints:
					CA:TRUE
		Signature Algorithm: sha256WithRSAEncryption
			 a0:a3:1a:5e:e0:ff:b9:d1:fe:08:3d:c4:42:61:e9:cd:4f:2c:
			 c9:4b:5b:c4:8c:23:c5:81:88:39:55:52:41:97:46:26:c9:ef:
			 c8:37:04:60:d9:7b:81:39:a0:15:8b:8d:d2:96:55:c0:64:4b:
			 5c:14:2b:59:1b:3b:39:7b:4f:13:a5:54:2e:78:18:06:3f:f9:
			 5c:cc:3e:15:9e:be:cf:30:4e:c3:bf:8c:b1:b0:70:55:a7:ac:
			 2e:d5:6a:73:8e:b7:e5:12:93:9c:db:2b:2f:5b:64:d2:f5:7d:
			 86:05:3b:68:7b:7e:5e:dd:4d:98:56:95:5c:68:1e:3d:b0:14:
			 f5:9f:bd:4d:a0:f9:cf:7e:45:cf:e3:e7:4c:91:cb:cc:cd:f7:
			 5f:a0:e5:50:ae:c3:c7:39:d0:0f:05:69:9d:ac:8c:1a:20:12:
			 62:7c:ed:16:77:93:b4:33:af:9c:09:5f:d5:79:8a:1b:60:1f:
			 90:d4:cd:ba:cd:30:16:27:6b:ed:80:60:3a:c3:47:1f:0e:d3:
			 2b:fe:c6:8c:6f:3b:22:90:d9:c0:c8:1b:bc:a9:56:7d:b0:9f:
			 a8:fc:c7:08:4a:9d:9f:20:16:61:93:c5:0d:2d:12:93:f1:95:
			 c1:36:c4:28:b9:43:6c:af:37:f1:ac:96:c3:d5:21:1d:fd:a6:
			 2e:91:84:15

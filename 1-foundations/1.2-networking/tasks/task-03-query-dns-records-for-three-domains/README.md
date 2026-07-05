# Task 3: Query DNS Records for Three Domains

## Objective

Use `dig` and `nslookup` to query A, MX, TXT, and NS records for 3 different domains.

<!-- LOG_OUTPUT -->


---

##  Queried A, MX, TXT, and NS records for google.com, cloudflare.com, and github.com using dig and nslookup for cross-verification

> **Timestamp:** `2026-07-05 22:16:00`

### 01. `dig google.com A +short`

```bash
dig google.com A +short
```

**Output:**

```text
172.217.22.142
```

### 02. `dig cloudflare.com A +short`

```bash
dig cloudflare.com A +short
```

**Output:**

```text
104.16.132.229
104.16.133.229
```

### 03. `dig github.com A +short`

```bash
dig github.com A +short
```

**Output:**

```text
140.82.121.4
```

### 04. `dig google.com MX +short`

```bash
dig google.com MX +short
```

**Output:**

```text
10 smtp.google.com.
```

### 05. `dig cloudflare.com MX +short`

```bash
dig cloudflare.com MX +short
```

**Output:**

```text
10 mxa.global.inbound.cf-emailsecurity.net.
5 mxa-canary.global.inbound.cf-emailsecurity.net.
10 mxb.global.inbound.cf-emailsecurity.net.
5 mxb-canary.global.inbound.cf-emailsecurity.net.
```

### 06. `dig github.com MX +short`

```bash
dig github.com MX +short
```

**Output:**

```text
0 github-com.mail.protection.outlook.com.
```

### 07. `dig google.com TXT +short`

```bash
dig google.com TXT +short
```

**Output:**

```text
"Z29vZ2xl"
"onetrust-domain-verification=0d477fe608074e6f9c12bca7826035cc"
"cisco-ci-domain-verification=47c38bc8c4b74b7233e9053220c1bbe76bcc1cd33c7acf7acd36cd6a5332004b"
"google-site-verification=wD8N7i1JTNTkezJ49swvWW48f8_9xveREV4oB-0Hf5o"
"v=spf1 include:_spf.google.com ~all"
"docusign=1b0a6754-49b1-4db5-8540-d2c12664b289"
"globalsign-smime-dv=CDYX+XFHUw2wml6/Gb8+59BsH31KzUr6c1l2BPvqKX8="
"MS=E4A68B9AB2BB9670BCE15412F62916164C0B20BB"
"google-site-verification=TV9-DBe4R80X4v0M4U_bd_J9cpOJM0nikft0jAgjmsQ"
"facebook-domain-verification=22rm551cu4k0ab0bxsw536tlds4h95"
"google-site-verification=4ibFUgB-wXLQ_S7vsXVomSTVamuOXBiVAzpR5IZ87D0"
"apple-domain-verification=30afIBcvSuDV2PLX"
"onetrust-domain-verification=6d685f1d41a94696ad7ef771f68993e0"
"docusign=05958488-4752-4ef2-95eb-aa7ba8a3bd0e"
```

### 08. `dig cloudflare.com TXT +short`

```bash
dig cloudflare.com TXT +short
```

**Output:**

```text
"stripe-verification=5096d01ff2cf194285dd51cae18f24fa9c26dc928cebac3636d462b4c6925623"
"logmein-verification-code=b3433c86-3823-4808-8a7e-58042469f654"
"docker-verification=c578e21c-34fb-4474-9b90-d55ee4cba10c"
"atlassian-domain-verification=WxxKyN9aLnjEsoOjUYI6T0bb5vcqmKzaIkC9Rx2QkNb751G3LL/cus8/ZDOgh8xB"
"google-site-verification=ZdlQZLBBAPkxeFTCM1rpiB_ibtGff_JF5KllNKwDR9I"
"cisco-ci-domain-verification=27e926884619804ef987ae4aa1c4168f6b152ada84f4c8bfc74eb2bd2912ad72"
"MS=ms70274184"
"_saml-domain-challenge.2dc00405-79cd-457b-b288-a119c6f0c7b7.71996d53-d178-4ba9-bef4-7f7e46edab74.cloudflare.com=1c8736fd-84b2-4197-985f-3fb2852f2457"
"apple-domain-verification=DNnWJoArJobFJKhJ"
"asv=894f6d1f9f83bcf44e4b1bc40bc1c4aa"
"v=spf1 ip4:199.15.212.0/22 ip4:173.245.48.0/20 include:_spf.google.com include:spf1.mcsv.net include:spf.mandrillapp.com include:mail.zendesk.com include:stspg-customer.com include:_spf.salesforce.com -all"
"databank-domain-verification-hkehd2=fzgu4kmbZwMoW99zENgO4u8NL"
"stripe-verification=bf1a94e6b16ace2502a4a7fff574a25c8a45291054960c883c59be39d1788db9"
"facebook-domain-verification=h9mm6zopj6p2po54woa16m5bskm6oo"
"status-page-domain-verification=r14frwljwbxs"
"onetrust-domain-verification=bd5cd08a1e9644799fdb98ed7d60c9cb"
"miro-verification=bdd7dfa0a49adfb43ad6ddfaf797633246c07356"
"creatopy-domain-verification=97d2ca50-9b6f-4a21-9bdb-fbb630e4cec7"
"drift-domain-verification=f037808a26ae8b25bc13b1f1f2b4c3e0f78c03e67f24cefdd4ec520efa8e719f"
"uber-domain-verification=58086039-150a-42a4-a4be-b4032921aa0f"
"_wkjc0fot0d7qrvrdt78bxkj2e2o67d2"
"canva-site-verification=oOyaVnHC-OiFoR1BPvetNA"
"_neqmkgaq1lq9it5s8qmetrhbnu121wb"
"liveramp-site-verification=EhH1MqgwbndTWl1AN64hOTKz7hc1s80yUpchLbgpfY0"
"ZOOM_verify_7LFBvOO9SIigypFG2xRlMA"
"google-site-verification=C7thfNeXVahkVhniiqTI1iSVnElKR_kBBtnEHkeGDlo"
```

### 09. `dig github.com TXT +short`

```bash
dig github.com TXT +short
```

**Output:**

```text
"krisp-domain-verification=ZlyiK7XLhnaoUQb2hpak1PLY7dFkl1WE"
"MS=ms58704441"
"stripe-verification=f88ef17321660a01bab1660454192e014defa29ba7b8de9633c69d6b4912217f"
"loom-site-verification=f3787154f1154b7880e720a511ea664d"
"00Dd0000000hHE0=1TBKg000000TN2r"
"facebook-domain-verification=39xu4jzl7roi7x0n93ldkxjiaarx50"
"shopify-verification-code=t1YPwcmvnxZyBycaCpk1MPyWoFs72o"
"apple-domain-verification=RyQhdzTl6Z6x8ZP4"
"TAILSCALE-xOzoDvFUzZr5YYVCQFuD"
"jamf-site-verification=XtaPNIYghF_e_xRDI8CjgQ"
"anthropic-domain-verification-4az7qn=if8YWuRRqwLycGJDooumzHtxm"
"atlassian-domain-verification=jjgw98AKv2aeoYFxiL/VFaoyPkn3undEssTRuMg6C/3Fp/iqhkV4HVV7WjYlVeF8"
"google-site-verification=UTM-3akMgubp6tQtgEuAkYNYLyYAvpTnnSrDMWoDR3o"
"v=spf1 ip4:192.30.252.0/22 include:spf.protection.outlook.com include:_netblocks.google.com include:_netblocks2.google.com include:mail.zendesk.com include:_spf.salesforce.com include:servers.mcsv.net include:mktomail.com include:sendgrid.net ip4:62.253.2" "27.114 ip4:166.78.69.169 ip4:166.78.69.170 ip4:166.78.71.131 ~all"
"MS=6BF03E6AF5CB689E315FB6199603BABF2C88D805"
"miro-verification=d2e174fdb00c71e0bcf58f8e58c3da2dd80dcfa9"
"google-site-verification=82Le34Flgtd15ojYhHlGF_6g72muSjamlMVThBOJpks"
"calendly-site-verification=at0DQARi7IZvJtXQAWhMqpmIzpvoBNF7aam5VKKxP"
"MS=ms44452932"
"adobe-idp-site-verification=b92c9e999aef825edc36e0a3d847d2dbad5b2fc0e05c79ddd7a16139b48ecf4b"
"docusign=087098e3-3d46-47b7-9b4e-8a23028154cd"
```

### 10. `dig google.com NS +short`

```bash
dig google.com NS +short
```

**Output:**

```text
ns4.google.com.
ns2.google.com.
ns1.google.com.
ns3.google.com.
```

### 11. `dig cloudflare.com NS +short`

```bash
dig cloudflare.com NS +short
```

**Output:**

```text
ns7.cloudflare.com.
ns5.cloudflare.com.
ns6.cloudflare.com.
ns3.cloudflare.com.
ns4.cloudflare.com.
```

### 12. `dig github.com NS +short`

```bash
dig github.com NS +short
```

**Output:**

```text
ns-1707.awsdns-21.co.uk.
dns3.p08.nsone.net.
ns-421.awsdns-52.com.
dns1.p08.nsone.net.
dns2.p08.nsone.net.
ns-1283.awsdns-32.org.
dns4.p08.nsone.net.
ns-520.awsdns-01.net.
```

### 13. `nslookup -type=A google.com`

```bash
nslookup -type=A google.com
```

**Output:**

```text
;; Got recursion not available from 172.30.16.1
Server:		172.30.16.1
Address:	172.30.16.1#53

Non-authoritative answer:
Name:	google.com
Address: 172.217.22.142

```

### 14. `nslookup -type=MX google.com`

```bash
nslookup -type=MX google.com
```

**Output:**

```text
;; Got recursion not available from 172.30.16.1
Server:		172.30.16.1
Address:	172.30.16.1#53

Non-authoritative answer:
google.com	mail exchanger = 10 smtp.google.com.

Authoritative answers can be found from:

```

### 15. `nslookup -type=A cloudflare.com`

```bash
nslookup -type=A cloudflare.com
```

**Output:**

```text
;; Got recursion not available from 172.30.16.1
Server:		172.30.16.1
Address:	172.30.16.1#53

Non-authoritative answer:
Name:	cloudflare.com
Address: 104.16.132.229
Name:	cloudflare.com
Address: 104.16.133.229

```

### 16. `nslookup -type=MX cloudflare.com`

```bash
nslookup -type=MX cloudflare.com
```

**Output:**

```text
;; Got recursion not available from 172.30.16.1
Server:		172.30.16.1
Address:	172.30.16.1#53

Non-authoritative answer:
cloudflare.com	mail exchanger = 10 mxa.global.inbound.cf-emailsecurity.net.
cloudflare.com	mail exchanger = 5 mxa-canary.global.inbound.cf-emailsecurity.net.
cloudflare.com	mail exchanger = 10 mxb.global.inbound.cf-emailsecurity.net.
cloudflare.com	mail exchanger = 5 mxb-canary.global.inbound.cf-emailsecurity.net.

Authoritative answers can be found from:

```

### 17. `nslookup -type=A github.com`

```bash
nslookup -type=A github.com
```

**Output:**

```text
;; Got recursion not available from 172.30.16.1
Server:		172.30.16.1
Address:	172.30.16.1#53

Non-authoritative answer:
Name:	github.com
Address: 140.82.121.4

```

### 18. `nslookup -type=MX github.com`

```bash
nslookup -type=MX github.com
```

**Output:**

```text
;; Got recursion not available from 172.30.16.1
Server:		172.30.16.1
Address:	172.30.16.1#53

Non-authoritative answer:
github.com	mail exchanger = 0 github-com.mail.protection.outlook.com.

Authoritative answers can be found from:

```


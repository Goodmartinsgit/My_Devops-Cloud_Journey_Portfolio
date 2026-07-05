# Task 2: Subnet a /24 Network into 4 Equal Subnets

## Objective

Manually calculate subnet details for `10.10.10.0/24` divided into 4 equal subnets. Calculate broadcast, network, and host range for each.

<!-- LOG_OUTPUT -->


---

##  Manual subnet calculation for 10.10.10.0/24: borrowed 2 bits (2^2=4 subnets), new prefix /26, block size 64, 62 usable hosts per subnet, mask 255.255.255.192

> **Timestamp:** `2026-07-05 21:33:32`



```bash

```

**Output:**

```text
MANUAL SUBNET CALCULATION: 10.10.10.0/24
─────────────────────────────────────────
STARTING POINT
  Network   : 10.10.10.0/24
  Host bits : 8  →  2^8 = 256 total addresses

STEP 1 — Bits to borrow
  Subnets needed : 4
  Formula        : 2^n >= 4  →  n = 2 bits
  Combinations   : 00 | 01 | 10 | 11  (4 subnet IDs)

STEP 2 — New prefix
  /24 + 2 borrowed bits = /26
  Remaining host bits   : 8 - 2 = 6

STEP 3 — Block size and usable hosts
  Block size    : 2^6 = 64 addresses per subnet
  Usable hosts  : 64 - 2 = 62  (minus network + broadcast)

STEP 4 — Subnet mask
  Last octet    : 11000000 (binary) = 192 (decimal)
  Subnet mask   : 255.255.255.192

STEP 5 — Subnet table
  #  Network          Host Range                  Broadcast        Prefix
  1  10.10.10.0    →  10.10.10.1  - 10.10.10.62   10.10.10.63    /26
  2  10.10.10.64   →  10.10.10.65 - 10.10.10.126  10.10.10.127   /26
  3  10.10.10.128  →  10.10.10.129- 10.10.10.190  10.10.10.191   /26
  4  10.10.10.192  →  10.10.10.193- 10.10.10.254  10.10.10.255   /26
─────────────────────────────────────────
```


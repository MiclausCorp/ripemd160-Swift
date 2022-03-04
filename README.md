# ripemd160-Swift

A Swift implementation of the [RIPE Message Digest 160](https://en.wikipedia.org/wiki/RIPEMD) **(ripemd160)** Hashing Algorithm.

[![Build Status](https://github.com/MiclausCorp/ripemd160-Swift/actions/workflows/Build.yml/badge.svg?branch=master)](https://github.com/MiclausCorp/ripemd160-Swift/actions/workflows/Build.yml)
[![Get on SPM](https://img.shields.io/badge/Available%20on-Swift%20Package%20Manager-orange?logo=swift)](#installation)

## Installation
#### Swift Package Manager

You can use [Swift Package Manager](https://swift.org/package-manager/) and specify dependency in `Package.swift` by adding this:
```swift
.package(url: "https://github.com/MiclausCorp/ripemd160-Swift.git", branch: "master")
```

## Example Usage
#### Hashing a string
```swift
let message = "Hello, World!"
let hash = RIPEMD160.hash(message)

print(hash) // prints raw bytes
```

#### Hash-Based Message Authentication Code
```swift
let key = "key"
let message = "Hello, World!"

let hmac = RIPEMD160.hmac(key: key, message: message)
print(hmac) // prints raw bytes
```

## Performance
![Compute Benchmark](https://user-images.githubusercontent.com/70854359/155883387-813d793e-9330-4a03-8c25-a0fcf8283386.jpg)

Tests provided by and run on **AWS EC2 P3dn.24xlarge** Cloud Super Workstation configured using:
- **8x NVIDIA Tesla V100 GPU** (256 GB, 960 CUDA Cores and 5.120 Tensor Cores in total);
- **96 core Intel Xeon 8175M**;
- **768 GB RAM**
- **2x 900 GB NVMe SSD**
- **100 Gbps networking**

## License
[MIT License](LICENSE)

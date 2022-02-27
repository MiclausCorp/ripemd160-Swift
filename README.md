# ripemd160-Swift

A Swift implementation of the ripemd160 Hashing Algorithm.

[![Get on SPM](https://img.shields.io/badge/Add%20Package%20From-Swift%20Package%20Manager-orange?logo=swift)](#installation)

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

print(hash) // prints raw hex bytes
```

#### Hash-Based Message Authentication Code
```swift
let key = "key"
let message = "Hello, World!"

let hmac = RIPEMD160.hmac(key: key, message: message)
print(hmac) // prints raw hex bytes
```

## Performance
![Kilohash Compute Benchmark](https://user-images.githubusercontent.com/70854359/155883387-813d793e-9330-4a03-8c25-a0fcf8283386.jpg)

Tests provided by and run on **AWS EC2 P3DN** Cloud Super Workstation configured using:
- **8x NVIDIA Tesla V100 GPU** (256 GB, 960 CUDA Cores and 5.120 Tensor Cores in total);
- **96 core Intel Xeon 8175M**;
- **768 GB RAM**
- **2 x 900 GB NVMe SSD**
- **100 Gigabit networking**

## License
[MIT License](LICENSE)

# Custom Operators
![swift >= 4.0](https://img.shields.io/badge/swift-%3E%3D4.0-brightgreen.svg)
![macOS](https://img.shields.io/badge/os-macOS-green.svg?style=flat)
![Linux](https://img.shields.io/badge/os-linux-green.svg?style=flat)
![Apache 2](https://img.shields.io/badge/license-Apache2-blue.svg?style=flat)

A set of custom operators to extend the swift language

## Usage
```swift
// XOR operators
var a: Bool = true
let b: Bool = false
a ^^ b // a XOR b ===> true

// Smallest operators
let a: Int = 1
let b: Int = 2
let c: Int? = nil

(a ?< b) // ====> a(1)
(b ?< a) // ====> a(1)
(a ??< c) // ====> a(1)
(c ??< a) // ====> a(1)

// Largest operators
let a: Int = 1
let b: Int = 2
let c: Int? = nil

(a ?> b) // ====> b(2)
(b ?> a) // ====> b(2)
(a ??> c) // ====> a(1)
(c ??> a) // ====> a(1)
```
## Author

* **Tyler Anger** - *Initial work* - [TheAngryDarling](https://github.com/TheAngryDarling)

## License

This project is licensed under Apache License v2.0 - see the [LICENSE.md](LICENSE.md) file for details


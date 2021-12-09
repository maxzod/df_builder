# **PART OF QUEEN PACKAGES 👑**

# Dart File Builder = DFB

# Motivation

generating dart code with build_runner will not work if you are trying to convert json to dart since it requires dart code in the first place .

so i made this simple dart generator , mainly it meant for json to dart conversion
to provide easy and simple way to create `TR` file for nations package also can be use for other use cases

# Usage

- start with `DartFileBuilder`
- add what you need from `ClassBuilder` `ClassGetter` `ClassProp`
- convert it to string using `DartFileBuilder`.toString()

# Builders

# DartFileBuilder

- can add comments
- can add exports
- can add imports

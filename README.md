# STree
An experimental format for FileTree (obsolete in Pharo 7)


## Features
- Chunk format based
- Easier to review conflicts on git

## Tips
How to change FileTree's format

```smalltalk
MCFileTreeRepository defaultPackageExtension:'.stree'. "STree"
MCFileTreeRepository defaultPackageExtension:'.package'. "Back to Cypress"
```

## Installation

```
Metacello new
 baseline:'STree';
 repository: 'github://mumez/STree/repository';
 load.
```
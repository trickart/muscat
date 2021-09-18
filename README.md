# Muscat

muscatは日本語の文言をUILabel等に表示する際、改行位置を調整するツールです。  
https://speakerdeck.com/trickart/split-japanese-sentence-for-uilabel-and-swiftui-text  

## Usage

### Localizable.stringsを生成したい場合

修正中

~~
[mint](https://github.com/yonaskolb/Mint)を利用してインストールすることができます。

``` Mintfile
trickart/muscat
```

```
$ mint run trickart/muscat in.strings out.strings
```
~~

### プロダクト内で使う場合

Swift Packageとしてプロジェクトに追加してください。

``` swift:Package.swift
dependencies: [
    .package(url: "https://github.com/trickart/muscat.git", .upToNextMinor(from: "0.0.1"))
]
```

MuscatCoreクラスを用いて文を分割することができます。

```
import MuscatKit

let processed = MuscatCore().process(
    text: "あのイーハトーヴォのすきとおった風、夏でも底に冷たさをもつ青いそら、うつくしい森で飾られたモリーオ市、郊外のぎらぎらひかる草の波。"
)
```

# なんなん

にゃ？

## Build
1. ビルドするときはgithub codespacesで立ち上げる
2. `fak compile -kb 3x2_macrpoad -km default`でビルド
3. 生成された"2x3_macropad.default.central.ihx"をローカルへダウンロード
4. 対象機のSW2をショートさせた状態でUSB接続
5. `wchisp flash 3x2_macropad.default.central.ihx`で焼く

## memo
keyboard.nclの`PhysicalEncoder 31 30 2,`はEC11E18244AUに交換した場合の値のため、デフォルトのものの場合は2から変更する必要があるかも（未確認）
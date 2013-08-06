CodeIQ×はてな エンジニア夏祭り2013
株式会社Zaim 閑歳 孝子 さん
https://codeiq.jp/ace/kansai_takako/

====================================


問題をRubyで解いてみた

## 動作確認環境
* ruby 2.0.0

ファイル解説
neapolitan_detective.rb:
ナポリタン探偵。
混ぜ合わされたスパゲティの中からナポリタンを見つける。

pasta_mixer.rb
パスタ混ぜ機。
スパゲティをまぜてそのあとにナポリタンを１文字ずつ混入させた文字列を生成する。



====================================
問題文
■ 課題

以下のようにスパゲティ（spagetti）という文字 50 個分をバラバラにしてランダムに配置した文字列があります。この中に前から順番に「n」「e」「a」「p」「o」「l」「i」「t」「a」「n」という順番でナポリタン（neapolitan）という文字が隠れています。その該当文字を抜き出し、前後に [ ] を付け加えてください。

-------
gtgtsgipgttptinggipsppaigsesgpetgstpatetisiesagaeaigttetepitiatsegssieeeeatepaaiagtpieataatppiitgiapsteitatiiatpetetetttgpetpaasipttssstpeeeggtiagtttegtiipestsasgpsepaasapttgattgiatppegitiatpasgatgepttggapesaeetaeissttggieietgspagesiipestipggstttpateptitiaetottissgggtttaipappgstsptttgtpispattgegstltiappseisapgistaiagteeiptptpisaieisagstapeteietgteiisgtiptstgtstasspeatspptitttatteastsgtptgtasggpniaaeteaisett
-------

例として、以下の様な状態に文字列を変換できれば正解です。

-------
gtgtsgipgttpti[n]ggipsppaigs[e]sgpetgstpatetisiesagaeaigttetepitiatsegssieeeeatepaaiagtpieata[a]tppiitgia[p]steitatiiatpetetetttgpetpaasipttssstpeeeggtiagtttegtiipestsasgpsepaasapttgattgiatppegitiatpasgatgepttggapesaeetaeissttggieietgspagesiipestipggstttpateptitiaet[o]ttissgggtttaipappgstsptttgtpispattgegst[l]tiappse[i]sapgis[t]aiagteeiptptpisaieisagstapeteietgteiisgtiptstgtst[a]sspeatspptitttatteastsgtptgtasggp[n]iaaeteaisett
-------


■ 注意事項
- 必ず文字の先頭から [n][e][a][p][o][l][i][t][a][n] という並びになるようにしてください
- 例えば「i」など複数回出現するような文字の場合は [l] と [t] の間にあれば、どの i に [] がついても問題ありません



※ 解答は作成したプログラムのソースコードをtxtファイルに貼り付けていただき、そのファイルのみをアップロードしてください。
# social-engineer-tree DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|nickname|string|null: false|
### Association
- has_many :tweets
- has_many :comments

## tweetsテーブル
|Column|Type|Options|
|------|----|-------|
|image|text||
|text|text||
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :comments

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|tweet_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :tweet
- belongs_to :user

### Why
# 自分達のようなプログラミング未経験者のユーザーが最終的に作成したポートフォリオをクライアントに紹介しやすいサイトがないか？と考えたため

# What
# layout
  # header(要素)画面上部に配置
  # (中身)アプリのタイトル(social-engineer-tree)
  # ユーザー名
  # ログインアイコン
  # ログアウトアイコン
  
  # main(要素)画面中央に配置
  # (中身)
  # tittericon、instagramicon、facebookicon、Qeutaicon、teratailicon、Newspickicon、giticon、AWSicon、slackicon、herokuicon配置

  # right-side-bar(要素)
  # (中身)
  # 投稿フォーム、投稿一覧画面

# 機能概要
# main画面
# 配置されている各アイコンクリック時：該当するサイトへ飛ぶ

# header画面
# ユーザー名をクリック時：ユーザー編集画面へ遷移する

# edit画面：名前、アドレス、passwordの変更が可能→更新ボタンで更新される

# ログイン画面：名前、password入力及びログインボタンの設置

# ログインボタンクリック時：ログインぺーじへ遷移する→名前、passwordを入力しログインボタン押下でmain画面へ遷移する
# 未ログイン時、ログイン後共にrootはmain画面 
# ログイン中は headerにはログアウトボタンのみ表示
# 未ログイン時はログインボタンのみ表示

# right-side-bar画面
# 投稿フォームからテキスト、画像、urlが投稿できる（画像nullでも投稿可能）

# 投稿一覧画面から投稿された内容をクリック時に「詳細」、「削除」が表示。
# *削除は自身の投稿のみ

# 詳細画面からはコメント機能も使える
# 可能であれば投稿一覧では「コメントがあります」というalertが欲しい

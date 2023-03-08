token=$GIT_TOKEN #GitHubのトークンを設定

for f in "$@"
do
  curl \
    -H "Accept: application/vnd.github+json" \
    -H "Authorization: Bearer $token"\
    "https://api.github.com/users/$f/events/public?per_page=100" > /Users/cmiura/Documents/tmp_githubdata/$f.tmp.json

  cd /Users/cmiura/Documents/tmp_githubdata
  ruby json_parse.rb $f > /Users/cmiura/Documents/tmp_githubdata/$f.tmp.json.parse


  #ブラウザで結果を見たいとき
  #open /Users/cmiura/Documents/tmp_githubdata/$f.tmp.json.parse -a /Applications/Google\ Chrome.app

  #コマンドラインで結果を見たいとき
  while read line
  do
    echo $line
  done < /Users/cmiura/Documents/tmp_githubdata/$f.tmp.json.parse
done


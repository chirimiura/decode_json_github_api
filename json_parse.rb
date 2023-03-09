require "json"

###変数宣言
#APIの返却データ数をカウント
cnt = 0
#出力用テキストの箱
str = ""

File.open(ARGV[0]+".tmp.json") do |f|
  data = JSON.load(f)
  #p data

  for t in data do
    if t['id'] != '' then
      cnt = cnt+1
      str = cnt.to_s     
      str += "_"
      str += t['created_at']
      str += "_"
      str += t['id']
      p str;
      
    end
    if t['type'] == 'PullRequestEvent' then
      print t['payload']['pull_request']['base']['user']['login']+','+t['payload']['pull_request']['base']['repo']['language']+','+t['payload']['pull_request']['url']+"\n"
    end
  end
end

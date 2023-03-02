require "json"

File.open(ARGV[0]+".tmp.json") do |f|
  data = JSON.load(f)
  # p data

  for t in data do
    if t['type'] == 'PullRequestEvent' then
      print t['payload']['pull_request']['base']['user']['login']+','+t['payload']['pull_request']['base']['repo']['language']+','+t['payload']['pull_request']['url']+"\n"
    end
  end
end

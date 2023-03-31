# piyopiyo-notifier
練馬区一時預かりの予約システム[piyopiyo](https://www.nerima-piyopiyo.com/piyopiyo/) のページを解析して、もし土日祝が空いてあれば、通知してくれるnotifierです。

# 参照
> ※予約可能日は、毎日午前9時30分に更新します（1日ごとに1か月後の同日が予約可能になります。

https://www.city.nerima.tokyo.jp/kosodatekyoiku/kodomo/hoiku/itijiteki_hoiku/nyuuyoujiazukari.html

# 使い方
## Local
```
bundle config set --local path 'vendor/bundle' \ 
bundle install

export SLACK_WEBHOOK_URL="https://hooks.slack.com/services/XXXXXXXXX/XXXXXXXXX/XXXXXXXXXXXXXXXXXXXXXXXX"
sls invoke local -f notifier
```

## AWS Lambda 
1. Create a Slack Incoming Webhook
https://api.slack.com/incoming-webhooks
2. Set the webhook url to AWS Lambda's environment variable
3. Deploy

```
sls deploy
```

# 例
- ![image](https://user-images.githubusercontent.com/853200/229153202-de74d802-e60e-4ec2-aa3a-a4af17b05414.png)

# TODO
- [x] List all the availalbe days
- [x] Filter the result
- [x] Send the result to Slack
- [x] Create a cron job
- [ ] Automatically book the day that you want
- [ ] Line Notify

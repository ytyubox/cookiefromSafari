# Flow

1. SafariViewController 訪問 URL
2. 設定 info.plist::URL types::URL Schemes:: ytyuboxcookietry
3. URL redirect 至 app scheme "ytyuboxcookietry://" + _COOKIE_
4. func application(_ app:, open url:, options:) 中的 URL 可拿到 step 3. 的 URL
5. SafariViewControllerDelegate, remove SafariViewController

# README
### 開發需求

本教材的主要目的，是要開發一套「任務管理系統」。這個系統需要做到的事情有：

- 任務功能
	- 可新增自己的任務
	- 使用者登入後，只能看見自己建立的任務
	- 可設定任務的開始及結束時間
	- 可設定任務的優先順序（高、中、低）
	- 可設定任務目前的狀態（待處理、進行中、已完成）
	- 可依狀態篩選任務
	- 可以任務的標題、內容進行搜尋
	- 可為任務加上分類標籤
	- 任務列表，並可依優先順序、開始時間及結束時間等進行排序

滿足以上需求之後，還會需要如下的管理機制：

- 使用者的管理功能

### 瀏覽器支援

- 預設需要支援 macOS/Chrome 的最新版本

### 開發工具

請以下列程式語言、網站開發框架及資料庫系統的最新穩定版本進行開發：

- Ruby
- Ruby on Rails
- PostgreSQL

server 端請使用：

- Heroku

## Setup
`$ yarn install`
`$ bundle install`
`$ rake db:create rake db:migrate`
`$ rails s`

## Development

start the server

`$ foreman start -f Procfile.dev`

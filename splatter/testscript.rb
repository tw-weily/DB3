#Create 3 users
curl -i -h "Content-type: application/json" -X POST http://weily.sqrawler.com:3000/users -d '{"user": {"email":"user1@test.com", "name":"User 1", "password":"password"}}'
curl -i -h "Content-type: application/json" -X POST http://weily.sqrawler.com:3000/users -d '{"user": {"email":"user2@test.com", "name":"User 2", "password":"password"}}'
curl -i -h "Content-type: application/json" -X POST http://weily.sqrawler.com:3000/users -d '{"user": {"email":"user3@test.com", "name":"User 3", "password":"password"}}'

#Create 5 splatts for 3 users
curl -i -h "Content-type: application/json" -X POST http://weily.sqrawler.com:3000/splatts -d '{"splatt": {"body":"This is a test splatt", "user_id":"0"}}'
curl -i -h "Content-type: application/json" -X POST http://weily.sqrawler.com:3000/splatts -d '{"splatt": {"body":"Example splatt here", "user_id":"2"}}'
curl -i -h "Content-type: application/json" -X POST http://weily.sqrawler.com:3000/splatts -d '{"splatt": {"body":"Random splatt", "user_id":"0"}}'
curl -i -h "Content-type: application/json" -X POST http://weily.sqrawler.com:3000/splatts -d '{"splatt": {"body":"Hope this is working", "user_id":"1"}}'
curl -i -h "Content-type: application/json" -X POST http://weily.sqrawler.com:3000/splatts -d '{"splatt": {"body":"Last splatt", "user_id":"2"}}'

#First user follows other 2
curl -i -h "Content-type: application/json" -X POST http://weily.sqrawler.com:3000/users/follows -d '{{"user": {"user_id":"0"}}, {"followed_User": {"user_id":"1"}}}'
curl -i -h "Content-type: application/json" -X POST http://weily.sqrawler.com:3000/users/follows -d '{{"user": {"user_id":"0"}}, {"followed_User": {"user_id":"2"}}}'

#First user's splatts
curl -i -h "Content-type: application/json" -X GET http://weily.sqrawler.com:3000/splatts/0 -d '{"splatt": {"user_id":"0"}}'

#Users followed by first user
curl -i -h "Content-type: application/json" -X GET http://weily.sqrawler.com:3000/users/show-follows/0 -d '{"user": {"user_id":"0"}}'

#First users news feed
curl -i -h "Content-type: application/json" -X GET http://weily.sqrawler.com:3000/users/splatts-feed/0 -d '{"user": {"user_id":"1"}}'

#First user unfollows third user
curl -i -h "Content-type: application/json" -X POST http://weily.sqrawler.com:3000/users/delete-follows -d '{{"user": {"user_id":"0"}}, {"user2": {"user_id":"2"}}}'

#Display first users news feed again
curl -i -h "Content-type: application/json" -X GET http://weily.sqrawler.com:3000/users/splatts-feed/0 -d '{"user": {"user_id":"1"}}'
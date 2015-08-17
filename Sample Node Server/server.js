http = require('http');

var app = http.createServer(function(req,res){
    res.setHeader('Content-Type', 'application/json');
    res.end(JSON.stringify(
		{
		  "total_count": 40,
		  "incomplete_results": false,
		  "items": [
		    {
		      "id": 3081286,
		      "name": "Tetris",
		      "full_name": "dtrupenn/Tetris",
		      "owner": {
		        "login": "dtrupenn",
		        "id": 872147,
		        "avatar_url": "https://secure.gravatar.com/avatar/e7956084e75f239de85d3a31bc172ace?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png",
		        "gravatar_id": "e7956084e75f239de85d3a31bc172ace",
		        "url": "https://api.github.com/users/dtrupenn",
		        "received_events_url": "https://api.github.com/users/dtrupenn/received_events",
		        "type": "User"
		      },
		      "private": false,
		      "html_url": "https://github.com/dtrupenn/Tetris",
		      "description": "A C implementation of Tetris using Pennsim through LC4",
		      "fork": false,
		      "url": "https://api.github.com/repos/dtrupenn/Tetris",
		      "created_at": "2012-01-01T00:31:50Z",
		      "updated_at": "2013-01-05T17:58:47Z",
		      "pushed_at": "2012-01-01T00:37:02Z",
		      "homepage": "",
		      "size": 524,
		      "stargazers_count": 1,
		      "watchers_count": 1,
		      "language": "Assembly",
		      "forks_count": 0,
		      "open_issues_count": 0,
		      "master_branch": "master",
		      "default_branch": "master",
		      "score": 10.309712
		    },
		    {
		      "id": 3081286,
		      "name": "Mario",
		      "full_name": "dtrupenn/Mario",
		      "owner": {
		        "login": "dtrupenn",
		        "id": 872147,
		        "avatar_url": "https://secure.gravatar.com/avatar/e7956084e75f239de85d3a31bc172ace?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png",
		        "gravatar_id": "e7956084e75f239de85d3a31bc172ace",
		        "url": "https://api.github.com/users/dtrupenn",
		        "received_events_url": "https://api.github.com/users/dtrupenn/received_events",
		        "type": "User"
		      },
		      "private": false,
		      "html_url": "https://github.com/dtrupenn/Tetris",
		      "description": "A C implementation of Tetris using Pennsim through LC4",
		      "fork": false,
		      "url": "https://api.github.com/repos/dtrupenn/Tetris",
		      "created_at": "2012-01-01T00:31:50Z",
		      "updated_at": "2013-01-05T17:58:47Z",
		      "pushed_at": "2012-01-01T00:37:02Z",
		      "homepage": "",
		      "size": 524,
		      "stargazers_count": 1,
		      "watchers_count": 1,
		      "language": "Assembly",
		      "forks_count": 0,
		      "open_issues_count": 0,
		      "master_branch": "master",
		      "default_branch": "master",
		      "score": 10.309712
		    },
		    {
		      "id": 3081286,
		      "name": "Seahawks",
		      "full_name": "dtrupenn/Seahawks",
		      "owner": {
		        "login": "dtrupenn",
		        "id": 872147,
		        "avatar_url": "https://secure.gravatar.com/avatar/e7956084e75f239de85d3a31bc172ace?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png",
		        "gravatar_id": "e7956084e75f239de85d3a31bc172ace",
		        "url": "https://api.github.com/users/dtrupenn",
		        "received_events_url": "https://api.github.com/users/dtrupenn/received_events",
		        "type": "User"
		      },
		      "private": false,
		      "html_url": "https://github.com/dtrupenn/Tetris",
		      "description": "A C implementation of Tetris using Pennsim through LC4",
		      "fork": false,
		      "url": "https://api.github.com/repos/dtrupenn/Tetris",
		      "created_at": "2012-01-01T00:31:50Z",
		      "updated_at": "2013-01-05T17:58:47Z",
		      "pushed_at": "2012-01-01T00:37:02Z",
		      "homepage": "",
		      "size": 524,
		      "stargazers_count": 1,
		      "watchers_count": 1,
		      "language": "Assembly",
		      "forks_count": 0,
		      "open_issues_count": 0,
		      "master_branch": "master",
		      "default_branch": "master",
		      "score": 10.309712
		    }
		  ]
		}
		, null, 3));
});
app.listen(3000);
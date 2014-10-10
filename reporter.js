var GitHubApi = require("github");
var Overtrue = require('overtrue');
var fs = require('fs');

var github = new GitHubApi({
    // required
    version: "3.0.0",
});

var date = new Date();

github.authenticate({
    type: "basic",
    username: overtrue.username,
    password: overtrue.password
});


github.issues.create({
    user: 'overtrue',
    repo: 'latest-laravel',
    title: 'Failed at '.date.getMonth().'-'.date.getDay(),
    body: fs.readFileSync("test","utf-8"),
    labels: ['error'],
});
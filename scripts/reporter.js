//npm install github
var GitHubApi = require("github");
var overtrue = require('./overtrue');
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
    title: date.getFullYear() + '-' + date.getMonth() + '-' + date.getDay() + '  Failed!',
    body: "    \n" + fs.readFileSync("output","utf-8").replace(/\[\d{1,2}m/g, '*').replace(/^/g, '    '),
    labels: ['error'],
});

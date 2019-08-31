require.config({
    paths : {//以require.js为基础路径
        'jquery' : '../lib/jquery-1.10.1.min',
        'cookie' : '../lib/jquery.cookie',
        'comm' : 'common'
    },
    shim : {
        'index' : ['comm'],
        'index2' : ['jquery','cookie','comm']
    }
});





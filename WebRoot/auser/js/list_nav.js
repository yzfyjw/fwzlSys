var t;
t=outlookbar.addtitle('系统属性')
outlookbar.additem('系统属性',t,'/fwzlSys/auser/index/sysPro.jsp')


t=outlookbar.addtitle('普通短租房信息发布')
outlookbar.additem('进入发布',t,'/fwzlSys/auser/objfw/objfwAddByMe.jsp')

t=outlookbar.addtitle('其他类住宿信息发布')
outlookbar.additem('进入发布',t,'/fwzlSys/auser/objfw/qtzsAddByMe.jsp')


t=outlookbar.addtitle('房屋信息管理')
outlookbar.additem('我发布的信息',t,'/fwzlSys/objfwManaByMe.action')


/*
t=outlookbar.addtitle('收藏管理')
outlookbar.additem('我的收藏',t,'/fwzlSys/auser/objfw/shoucangByMe.jsp')

*/
t=outlookbar.addtitle('订单管理')
outlookbar.additem('我的预定',t,'/fwzlSys/jingpaiByMe.action')

t=outlookbar.addtitle('返回首页') 
outlookbar.additem('返回',t,'/fwzlSys/index.action')

t=outlookbar.addtitle('安全退出系统') 
outlookbar.additem('安全退出',t,'/fwzlSys/userLogout.action')
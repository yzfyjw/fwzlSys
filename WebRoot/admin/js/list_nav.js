var t;
t=outlookbar.addtitle('系统属性')
outlookbar.additem('系统属性',t,'/fwzlSys/admin/index/sysPro.jsp')


t=outlookbar.addtitle('基本操作')
outlookbar.additem('密码修改',t,'/fwzlSys/admin/userinfo/userPw.jsp')
outlookbar.additem('管理员维护',t,'/fwzlSys/adminManage.action')


t=outlookbar.addtitle('注册用户管理')
outlookbar.additem('注册用户',t,'/fwzlSys/userMana.action')


t=outlookbar.addtitle('短租房类别管理')
outlookbar.additem('开始管理',t,'/fwzlSys/catelogMana.action')


t=outlookbar.addtitle('普通短租房信息发布')
outlookbar.additem('进入发布',t,'/fwzlSys/admin/objfw/objfwAddByAdmin.jsp')

t=outlookbar.addtitle('其他类住宿信息发布')
outlookbar.additem('进入发布',t,'/fwzlSys/admin/objfw/qtzsAddByAdmin.jsp')


t=outlookbar.addtitle('房屋信息管理')
outlookbar.additem('开始管理',t,'/fwzlSys/objfwManaByAd.action')


t=outlookbar.addtitle('留言管理')
outlookbar.additem('开始管理',t,'/fwzlSys/liuyanMana.action')


t=outlookbar.addtitle('公告管理')
outlookbar.additem('开始管理',t,'/fwzlSys/gonggaoMana.action')




t=outlookbar.addtitle('安全退出系统') 
outlookbar.additem('安全退出',t,'/fwzlSys/login.jsp')
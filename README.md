# GNConfManager


定义 DailyConfModel对象  代表某一天对象
定义 DailyConfModel对象  代表某一天对象

DailyConfModel  有am(上午),pm(下午)属性


思路： 
        1、获取项目路径下《会议计划.text》文档
        2、在ConfManagerVM类中通过截取换行符获得一个会议列表数组confArray
        3、在ConfManager中生成DailyArray数组(缺省值包含一个DailyConfModel对象)
        4、在confArray数组遍历方法中嵌套遍历DailyArray
        5、DailyArray中的DailyConfModel对象的am,pm的数组加入confArray的某一条信息
        6、当DailyConfModel对象的am,pm的数组不能加某一条信息时，同时DailyConfModel对象是DailyArray的最后一个对象时，DailyArray新加一个对象，新加一个对象处理这条信息
        7、具体逻辑请看GNConfManager路径下ConfManagerVM,ConfManager，DailyConfModel代码处理
    

(function(){

    // banner

    /*
        id：轮播图可视区盒子
        cls：焦点图的样式class名
    */

    ImgShow('banner','banner_active')


    // main
    /* 选项卡+轮播图*/
   
    let example = document.getElementsByClassName('example');

    /* 
        tabsBox：包选项的ul
        changeBox：对应切换的所以选项卡盒子外层的div
    */
    function hotTabs(tabsBox,changeBox){
        for(let i = 0;i < tabsBox.children.length; i++){
            tabsBox.children[i].index = i;
        }
        tabsBox.onclick = function(ev) {
            if(ev.target.tagName.toLowerCase() == 'li') {
                for(let j = 0;j < tabsBox.children.length; j++){
                    tabsBox.children[j].className = '';
                    changeBox.children[j].style.display = 'none';
                }
                ev.target.className = 'cur';
                changeBox.children[ev.target.index].style.display = 'block';
            }
        }
    }

    // 选项卡
    hotTabs(jqlitab1,changeModel1);
    hotTabs(jqlitab2,changeModel2);
    hotTabs(jqlitab3,changeModel3);
    hotTabs(jqlitab4,changeModel4);
    
    // 选项卡的轮播图
    for(let k = 0;k < example.length; k++){
        // hotTabs('jqlitab' + (k + 1),'changeModel' + (k + 1));
        ImgMove('example_banner' + (k + 1),'span_active');
    }


})();
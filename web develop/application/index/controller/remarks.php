    <?php
namespace app\index\controller;

use think\controller;
use think\Db;
use app\index\model\Usr_tb;

//use think\Debug;
<script type="text/javascript">
     
      var span = document.getElementById("a");
      var per = span.innerText;
      //var per = console.log($file); 
      
      window.onload = function(){
        var tbody = document.getElementById('tbMain');
        
        for(var i = 0;i < per.length; i++){ //遍历一下json数据
          var trow = getDataRow(per[i]); //定义一个方法,返回tr数据
            tbody.appendChild(trow);
        }
        
        }
        function getDataRow(h){
       var row = document.createElement('tr'); //创建行
       
       var idCell = document.createElement('td'); //创建第一列id
       idCell.innerHTML = h.id; //填充数据
       row.appendChild(idCell); //加入行  ，下面类似
       
       var nameCell = document.createElement('td');//创建第二列name
       nameCell.innerHTML = h.name;
       row.appendChild(nameCell);
       
       var jobCell = document.createElement('td');//创建第三列job
       jobCell.innerHTML = h.job;
       row.appendChild(jobCell);
       
       //到这里，json中的数据已经添加到表格中，下面为每行末尾添加删除按钮
       
       var delCell = document.createElement('td');//创建第四列，操作列
       row.appendChild(delCell);
       var btnDel = document.createElement('input'); //创建一个input控件
       btnDel.setAttribute('type','button'); //type="button"
       btnDel.setAttribute('value','删除'); 
       

    //删除操作
       btnDel.onclick=function(){
         if(confirm("确定删除这一行嘛？")){
           //找到按钮所在行的节点，然后删掉这一行
           this.parentNode.parentNode.parentNode.removeChild(this.parentNode.parentNode);
           //btnDel - td - tr - tbody - 删除(tr)
           //刷新网页还原。实际操作中，还要删除数据库中数据，实现真正删除
           }
         }
       delCell.appendChild(btnDel);  //把删除按钮加入td，别忘了
       
       return row; //返回tr数据  
       }    
</script>




class edit extends controller
{

    
} 
<td id="filename"><a href="{:url('./index',array('download'=>$name.filename))}">{$filename}</a></td>
   <script>
        $(function click() {
            $("#btnTest").bind("click", function () {
                $("input").each(function () {
                    var obj = $(this);
                    var value = obj.parent("td").parent("th").find("td:filename").val();
                    return value;
                });
            });
        })
    </script>
    {:download('/index',array('name'=>$do['value']))}
              <td><a href="" action="index/download" onclick="click()">download</a></td>

     #生成用户
        $res=Usr_tb::create([
            'usrname' => 'lala',
            'passwd' => 'file11',
        ]);
        dump($res);
        #时间戳转换
        {$date|date="y-m-d",##}

        public function download()
    {
        $file_n = Db::name("file_tb")->where("filename",$request->param("filename"))->find();
        if ($file_n){
                session('file_id',$file_n['file_id']);
                session('filename',$file_n['filename']);
            }else{
                return $this->error('failed');
            }
     } 
      
        $file_path = str_replace("\\","/",ROOT_PATH.'public');
        $files = $file_path.$file;
        if(!file_exists($files)){
            return "file is not exist!";
        }else {
            //打开文件
            $file1 = fopen($files, "r");
            //输入文件标签
            Header("Content-type: application/octet-stream");
            Header("Accept-Ranges: bytes");
            Header("Accept-Length: " . filesize($files));
            Header("Content-Disposition: attachment; filename=" . $file_n["file_tb"]);
            echo fread($file1, filesize($files));
            fclose($file1);
            //下载文件存放目录  
            echo $file_dir . $file_name;
            //检查文件是否存在    
            if (! file_exists ( $file_dir . $file_name )) {    
                echo "文件找不到";    
                exit ();    
            } else {    
                //打开文件    
                $file = fopen ( $file_dir . $file_name, "r" );    
                //输入文件标签     
                Header ( "Content-type: application/octet-stream" );    
                Header ( "Accept-Ranges: bytes" );    
                Header ( "Accept-Length: " . filesize ( $file_dir . $file_name ) );    
                Header ( "Content-Disposition: attachment; filename=" . $file_name );    
                //输出文件内容     
                //读取文件内容并直接输出到浏览器    
                echo fread ( $file, filesize ( $file_dir . $file_name ) );    
                fclose ( $file );    
                exit ();    
            }       


for 循环生成表格
传递id

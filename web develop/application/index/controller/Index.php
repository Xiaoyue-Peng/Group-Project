<?php
namespace app\index\controller;

use think\controller;
use think\Db;
use app\index\model\Usr_tb;
use app\index\model\File_tb;
use think\file;
use think\request;
//use think\Debug;
//use Config;

class Index extends controller
{
    public function index()
    {
        // $file_own=Db::table('file_tb')
        // ->where('create_usr',session('username'))
        // ->group('file_ini_id')
        // ->field('file_ini_id')
        // ->select();
        // dump($file_own);

        $file_own=Db::table('file_tb')
        ->where('create_usr',session('username'))
        ->where('file_ini_id', field('file_ini_id'))
        // ->field('file_ini_id')
        // ->group('file_ini_id')
        ->select();
        dump($file_own);
       

        return $this->fetch('index',[
            'file_own' => $file_own 
        ]);
        //主页文件传输
    //     for ($i=0;$i<=3;$i++){ 
    //return $file_own;   
    }
   

    
    public function upload()
    {
        //判断文件上传是否出错
        $file=$this->request->file("file");
        if($_FILES["file"]["error"])
        {
            echo $_FILES["file"]["error"];
        }
        else
        {
            //控制上传的文件类型，大小
            if($_FILES["file"]["type"]=="text/plain"||$_FILES["file"]["type"]=="application/octet-stream"&&$_FILES["file"]["size"]<1024000)
            {            
                $file_exists=Db::table('file_tb')->where('file_name',$_FILES["file"]["name"])->find();      
                if ($file_exists)
                {
                    echo "File exists!";
                    //选择是否替换
                }
                else
                {
                    $new_file = $file->move('./static/upload');
                    $content=file_get_contents($new_file->getpathName());
                    // Db::table('file_tb')->insert([
                    File_tb::create([
                        'file_name'=>$_FILES["file"]["name"],
                        'file_ini_id' =>rand(),
                        'content'=>$content,
                     'create_usr'=>session('username'),
                    ]);
                    
                    return $this->success("upload success!");
                }
            }
            else
            {
                echo "file type error!";
            }
        }
    }
 
}
?>
    
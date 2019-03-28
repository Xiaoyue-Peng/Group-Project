<?php
namespace app\index\controller;

use think\controller;
use think\Db;
use app\index\model\Usr_tb;
use app\index\model\File_tb;
use app\index\model\Authority_tb;
use think\file;
use think\request;

class Index extends controller
{
    public function index()
    {

        $file_co=Db::table('authority_tb')
        ->where('co_user',session('username'))
        ->field('file_ini_id')
        ->group('file_ini_id')
        ->select();

        for ($i=0;$i<count($file_co);$i++){ 
        $version[$i]=Db::table('file_tb')
        ->where('file_ini_id',implode($file_co[$i]))
        ->max('pre_id');

        $file_own[$i]=Db::table('file_tb')
        ->where('file_ini_id',implode($file_co[$i]))
        ->where('pre_id',$version[$i])
        ->select();
    };

        $user = Db::table('usr_tb')
        ->where('usrname',session('username'))
        ->select();

        $err_1 = Db::table('err_tb')
            ->field('file_ini_id')
            ->group('file_ini_id')
            ->select();
          
        for ($i=0;$i<count($err_1);$i++){ 
        $m=0;
        $err_2[$i] =Db::table('authority_tb')
            ->where('file_ini_id',implode($err_1[$i]))
            ->where('co_user',session('username'))
            ->select(); 
        $m++;
        if($err_2[$i]){
            $err[$i] = Db::table('err_tb')
                ->where('file_ini_id',$err_2[$i][0]['file_ini_id'])
                ->select();
            return $this->fetch('index',[
            'file_own' => $file_own,
            'user'=>$user[0]['usrname'],
            'create_time'=> $user[0]['create_time'],
            'info'=>$user[0]['info'],
             'error'=>$err[$i]
        ]);
            }
        if (!$err_2[$i]&&$m==count($err_1))
            {
            return $this->fetch('index',[
                'file_own' => $file_own,
                'user'=>$user[0]['usrname'],
                'create_time'=> $user[0]['create_time'],
                'info'=>$user[0]['info'],
                 'error'=>' '
            ]);
            }
            
       
        }  
    }
   
    public function create(){
        $ini_id = rand();
        File_tb::create([
            'file_ini_id' =>$ini_id,
            'file_name' => 'unamed',
            'create_usr'=>session('username'),
            'update_usr'=>session('username'),  
                    ]);
        Authority_tb::create([
            'file_ini_id' =>$ini_id,
            'co_user'=>session('username'), 
                    ]);
        $file = Db::table('file_tb')
            ->where('file_ini_id',$ini_id)
            ->select();
        return $this->redirect("./edit",['fileid'=>$file[0]['file_id']]);
    }
    
    public function upload()
    {
        $file=$this->request->file("file");
        if($_FILES["file"]["error"])
        {
            echo $_FILES["file"]["error"];
        }
        else
        {
            //control file format and size
            if($_FILES["file"]["type"]=="text/plain"||$_FILES["file"]["type"]=="application/octet-stream"&&$_FILES["file"]["size"]<1024000)
            {            
                $file_exists=Db::table('file_tb')->where('file_name',$_FILES["file"]["name"])->find();      
                if ($file_exists)
                {
                    echo "File exists!";
                }
                else
                {
                    $new_file = $file->move('./static/upload');
                    $content=file_get_contents($new_file->getpathName());
                    $ini_id=rand();
                    File_tb::create([
                        'file_name'=>$_FILES["file"]["name"],
                        'file_ini_id' =>$ini_id,
                        'content'=>$content,
                     'create_usr'=>session('username'),
                     'update_usr'=>session('username'), 
                    ]);
                    
                    Authority_tb::create([
                        'file_ini_id' =>$ini_id,
                        'co_user'=>session('username'),
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
    
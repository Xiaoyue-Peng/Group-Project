<?php
namespace app\index\controller;

use think\controller;
use think\Db;
use app\index\model\File_tb;
use think\request;
use think\validate;
//use think\Debug;

class Edit extends Controller
{
	public function index(){
		$fileid = $_GET['fileid'];
		$res = Db::table('file_tb')
		->where('file_id',$fileid)->find();
		$old_version = Db::table('file_tb')
		->where('file_ini_id',$res['file_ini_id'])
		->select();
		return $this->fetch('edit',[
			'file_ini_id'=>$res['file_ini_id'],
			'filename' => $res['file_name'],
			'content'=>$res['content'],
    		'lastupdate' => $res['update_time'],
            'creator' => $res['create_usr'],
            'file_id' => $res['file_id'],
            'pre_id' =>$res['pre_id'],
            'old_version'=>$old_version
    	]);
	}

	public function update(Request $request){
		$post=$request->param();
		dump($post);
		if ($post){
			$pre_id_2 = Db::table('file_tb')
			->where('file_id',$post['file_id'])
			->field('pre_id')
			->find();
			if ($post['pre_id_1'] == implode($pre_id_2))
			{
				// Db::table('file_tb')
				// ->where('file_id',$post['file_id'])
				// ->update([
				// 	'file_name'=>$post['filename_update'],
				// 	'content'=>$post['content_update'],
				// 	'update_usr'=>session('username'),
				// ]);
				 File_tb::create([
                        'file_name'=>$post['filename_update'],
                        'file_ini_id' =>$post['file_ini_id'],
                        'content'=>$post['content_update'],
                     	'create_usr'=>$post['creator'],
                     	'update_usr'=>session('username'),
                     	'pre_id'=> $post['pre_id_1']+1 
                    ]);

				// Db::table('file_tb')
				// ->where('file_ini_id',$post['file_ini_id'])
				// ->setInc('pre_id');
				return $this->redirect('./index');
		}else{
			//版本错误，返回检测网站
			return $this->error('id');
		}
	}
	else{
		
		return $this->error('failed');
	}
	}
	
    
}
<?php
namespace app\index\controller;

use think\controller;
use think\Db;
use app\index\model\File_tb;
use app\index\model\Authority_tb;
use think\request;
use think\validate;

class Compare extends Controller
{
	//GET file_ini_id and return two last conflict files to compare.html
	 public function index(request $fileid){
		$file_ini_id = $_GET['fileid'];
		$version_max = Db::table('file_tb')
			->where('file_ini_id',$file_ini_id)
			->max('pre_id');
		$version_compare=$version_max-1;
		
		$res=Db::table('file_tb')
			->where('file_ini_id',$file_ini_id)
			->where('pre_id',$version_max)
			->select();

		$res_2=Db::table('file_tb')
			->where('file_ini_id',$file_ini_id)
			->where('pre_id',$version_compare)
			->select();
	
		return $this->fetch('compare',[
			'filename_compare' => $res_2['0']['file_name'],
			'content_compare'=>$res_2['0']['content'],
			'user_compare'=>$res_2['0']['update_usr'],
			'filename' => $res['0']['file_name'],
			'content'=>$res['0']['content'],
			'file_ini_id'=>$file_ini_id
    	]);
	}

	//choose previous version as latest
	public function update(Request $request){
		$post=$request->param();
		if ($post){
			$version=Db::table('file_tb')
        		->where('file_ini_id',$post['file_ini_id'])
       			->max('pre_id');

			Db::table('file_tb')
				->where('file_ini_id',$post['file_ini_id'])
				->where('pre_id',$version-1)
				->setInc('pre_id',2);
			
			Db::table('file_tb')
				->where('file_ini_id',$post['file_ini_id'])
				->where('pre_id',$version)	
				->setdec('pre_id');

			Db::table('file_tb')
				->where('file_ini_id',$post['file_ini_id'])
				->where('pre_id',$version+1)
				->setDec('pre_id');

			$file_id=Db::table('file_tb')
				->where('file_ini_id',$post['file_ini_id'])
				->where('pre_id',$version)
				->select();		
			return $this->redirect("./edit",['fileid'=>$file_id[0]['file_id']]);
	}
	else{	
		return $this->error('failed');
		}
	}

	//choose your version as latest
	public function contain(request $request){
		$post=$request->param();
		$version=Db::table('file_tb')
        	->where('file_ini_id',$post['file_ini_id'])
       		->max('pre_id');
        $file_id=Db::table('file_tb')
			->where('file_ini_id',$post['file_ini_id'])
			->where('pre_id',$version)
			->select();	
		Db::table('file_tb')
			->where('file_ini_id',$post['file_ini_id'])
			->where('pre_id',$version)
			->update([
			'file_name'=>$post['filename'],
			'content'=>$post['content']
		]);
		return $this->redirect("./edit",['fileid'=>$file_id[0]['file_id']]);




	}   
}
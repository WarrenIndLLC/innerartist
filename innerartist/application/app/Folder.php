<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class Folder extends Model {

	protected $fillable = ['name', 'share_id', 'user_id'];

    protected $appends = array('type');

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
    	'id'       => 'integer',
    	'user_id'  => 'integer',
    ];

    public function getTypeAttribute() {
        return 'folder';
    }

    public function photos()
    {
        return $this->hasMany('App\Photo');
    }

}

<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class Label extends Model {

    public function photos()
    {
        return $this->belongsToMany('App\Photo', 'photos_labels');
    }

}

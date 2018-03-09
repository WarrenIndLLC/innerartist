<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class ImageSticker extends Model {

	/**
	 * The database table used by the model.
	 *
	 * @var string
	 */

	protected $table = 'image_sticker';

    protected $fillable = ['category', 'folder_name','image_name'];
}

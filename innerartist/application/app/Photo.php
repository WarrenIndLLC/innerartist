<?php namespace App;

use Storage;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Photo extends Model {

    use SoftDeletes;

    protected $table = 'photos';

    protected $fillable = ['name', 'description', 'file_name', 'share_id', 'attach_id', 'file_size', 'user_id', 'folder_id', 'serialized_editor_state', 'width', 'height', 'password', 'created_at', 'updated_at', 'deleted_at'];

    protected $hidden  = ['attach_id'];

    protected $appends = array('absoluteUrl', 'originalUrl', 'extension', 'smallThumbnail', 'mediumThumbnail', 'largeThumbnail', 'isFavorite', 'type');

    /**
     * Whether or not this photo is favorited by the user.
     *
     * @return boolean
     */
    public function getIsFavoriteAttribute() {
        return $this->labels->contains('name', 'favorite');
    }

    public function getTypeAttribute() {
        return 'photo';
    }

    /**
     * Get photos original size absolute url (with editor modifications applied)
     *
     * @return string
     */
    public function getAbsoluteUrlAttribute()
    {
        return url("uploads/".($this->user_id ? $this->user_id : 'no-auth')."/{$this->id}/{$this->file_name}");
    }

    /**
     * Return absolute url for original image (without editor modification or resizes)
     *
     * @return string
     */
    public function getOriginalUrlAttribute()
    {
        return url('uploads/'.($this->user_id ? $this->user_id : 'no-auth')."/{$this->id}/".($this->extension === 'gif' ? '' : 'original.')."{$this->file_name}");
    }

    /**
     * Get url for photos large thumbnail.
     *
     * @return string
     */
    public function getLargeThumbnailAttribute()
    {
        return url('uploads/'.($this->user_id ? $this->user_id : 'no-auth')."/{$this->id}/".($this->extension === 'gif' ? '' : 'large.')."{$this->file_name}");
    }

    /**
     * Get url for photos medium thumbnail.
     *
     * @return string
     */
    public function getMediumThumbnailAttribute()
    {
        return url('uploads/'.($this->user_id ? $this->user_id : 'no-auth')."/{$this->id}/".($this->extension === 'gif' ? '' : 'medium.')."{$this->file_name}");
    }

    /**
     * Get url for photos small thumbnail.
     *
     * @return string
     */
    public function getSmallThumbnailAttribute()
    {
        return url('uploads/'.($this->user_id ? $this->user_id : 'no-auth')."/{$this->id}/".($this->extension === 'gif' ? '' : 'small.')."{$this->file_name}");
    }


    public function getExtensionAttribute()
    {
        return pathinfo($this->file_name, PATHINFO_EXTENSION);
    }

    public function getAbsolutePath()
    {
        return base_path("../uploads/{$this->user_id}/{$this->id}/{$this->file_name}");
    }

    public function getRelativePath($directory = false)
    {
        if ($directory) {
            return "uploads/".($this->user_id ? $this->user_id : 'no-auth')."/{$this->id}";
        } else {
            return "uploads/".($this->user_id ? $this->user_id : 'no-auth')."/{$this->id}/{$this->file_name}";
        }
    }

    /**
     * Get relative path for the image file we're going to apply editor modifications to.
     *
     * @return string
     */
    public function getRelativeEditorPath()
    {
        return "uploads/{$this->user_id}/{$this->id}/editor.{$this->file_name}";
    }

    public function labels()
    {
        return $this->belongsToMany('App\Label', 'photos_labels');
    }

}

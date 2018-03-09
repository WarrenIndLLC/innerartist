<?php namespace App;

use Illuminate\Auth\Authenticatable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Auth\Passwords\CanResetPassword;
use Illuminate\Contracts\Auth\Authenticatable as AuthenticatableContract;
use Illuminate\Contracts\Auth\CanResetPassword as CanResetPasswordContract;

class User extends Model implements AuthenticatableContract, CanResetPasswordContract {

	use Authenticatable, CanResetPassword;

	/**
	 * The database table used by the model.
	 *
	 * @var string
	 */
	protected $table = 'users';

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = ['id' => 'integer'];

	/**
	 * The attributes that are mass assignable.
	 *
	 * @var array
	 */
	protected $fillable = ['name', 'email', 'password', 'username', 'first_name', 'last_name', 'gender'];

    protected $appends = array('isAdmin');

	/**
	 * The attributes excluded from the model's JSON form.
	 *
	 * @var array
	 */
	protected $hidden = ['remember_token'];

    public function getPermissionsAttribute()
    {
        return isset($this->attributes['permissions']) ? json_decode($this->attributes['permissions']) : [];
    }

    public function setPermissionsAttribute($value)
    {
        $this->attributes['permissions'] = json_encode($value);
    }

    public function getIsAdminAttribute()
    {
        return isset($this->permissions->admin) && (int) $this->permissions->admin === 1;
    }

    public function folders()
    {
        return $this->hasMany('App\Folder');
    }

    public function photos()
    {
        return $this->hasMany('App\Photo');
    }

    public function activity()
    {
        return $this->hasMany('App\Activity');
    }

    public function oauth()
    {
        return $this->hasMany('App\Social');
    }

}

<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Classes extends Model
{
    protected $table = 'classes';
    protected $fillable = ['period', 'class_number','id'];
    public $timestamps = false;

    public function users()
    {
        return $this->belongsToMany(User::class , 'userhasclass') ;
    }
}

<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use DateTime;
use App\LibrarySetting;

class BorrowLog extends Model
{
    protected $guarded = ['id'];
    protected $casts = [
        'is_returned' => 'boolean',
    ];

    public function book()
    {
        return $this->belongsTo('App\Book');
    }

    public function user()
    {
        return $this->belongsTo('App\User');
    }

     public function adminAssigned()
    {
        return $this->belongsTo('App\User', 'staff_id', 'id');
    }

    public function scopeReturned($query)
    {
        return $query->where('is_returned', 1);
    }

    public function scopeBorrowed($query)
    {
        return $query->where('is_returned', 0);
    }

    public function getDays($date){
        $datetime1 = new DateTime($date);
        $datetime2 = new DateTime(date("Y-m-d"));
        $time = date_diff($datetime1 , $datetime2);

        return $time->format("%a");
    }

    public function getDenda(){
        $setting = LibrarySetting::first();
        return $setting->biaya_denda;
    }

    public function getMaximumDays(){
        $setting = LibrarySetting::first();
        return $setting->maksimal_hari;
    }

    public function details(){
        return $this->hasMany('App\Borrow_detail','borrow_id','id');
    }
}

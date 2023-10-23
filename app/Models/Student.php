<?php

namespace App\Models;

use Illuminate\Database\Eloquent\{Factories\HasFactory, Relations\BelongsTo, Relations\BelongsToMany, Model, SoftDeletes};

class Student extends Model
{
    use SoftDeletes, HasFactory;

    protected $primaryKey = 'id';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'birth_date',
        'responsible_name',
        'school_id',
    ];

    /**
     * The attributes that are dates.
     *
     * @var array<string, string>
     */
    protected $dates = [
        'created_at',
        'updated_at',
        'deleted_at'
    ];

    /**
     * Get the relation between school model
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function school(): BelongsTo
    {
        return $this->belongsTo(School::class);
    }

    /**
     * Get the relation between classroom model
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function classrooms(): BelongsToMany
    {
        return $this->belongsToMany(Classroom::class, 'classrooms_associations');
    }
}

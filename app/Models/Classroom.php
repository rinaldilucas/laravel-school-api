<?php

namespace App\Models;

use Illuminate\Database\Eloquent\{Factories\HasFactory, Relations\BelongsTo, Relations\BelongsToMany, Model, SoftDeletes};

class Classroom extends Model
{
    use SoftDeletes, HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'code',
        'responsible_id',
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
     * Get the relation between user model
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function responsible(): BelongsTo
    {
        return $this->belongsTo(User::class, 'responsible_id');
    }

    /**
     * Get the relation between school model
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function school(): BelongsTo
    {
        return $this->belongsTo(School::class, 'school_id');
    }

    /**
     * Get the relation between student model
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function students(): BelongsToMany
    {
        return $this->belongsToMany(Student::class, 'classrooms_associations');
    }
}

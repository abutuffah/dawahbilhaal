<?php

namespace api\modules\v1\models;
 
use yii\db\ActiveRecord;
/**
 * Country Model
 *
 * @author Budi Irawan <deerawan@gmail.com>
 */
class Armada extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'armada';
    }
 
    /**
     * We use the primary function because we don't use integer auto increment as a primary key.
     * @inheritdoc
     */
    public static function primaryKey()
    {
        return ['armada_id'];
    }
 
    /**
     * To let Yii know what fields exist on the table.
     * Define rules for validation
     */
    public function rules()
    {
       return [
            [['armada_nama', 'status'], 'required'],
            [['armada_keterangan', 'status'], 'string'],
            [['armada_nama'], 'string', 'max' => 100]
        ];
    }
}
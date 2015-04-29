<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "armada".
 *
 * @property integer $armada_id
 * @property string $armada_nama
 * @property string $armada_keterangan
 * @property string $status
 *
 * @property UserBooking[] $userBookings
 */
class Armada extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'armada';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['armada_nama', 'status'], 'required'],
            [['armada_keterangan', 'status'], 'string'],
            [['armada_nama'], 'string', 'max' => 100]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'armada_id' => 'Armada ID',
            'armada_nama' => 'Armada Nama',
            'armada_keterangan' => 'Armada Keterangan',
            'status' => 'Status',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUserBookings()
    {
        return $this->hasMany(UserBooking::className(), ['armada_id' => 'armada_id']);
    }
}

<?php

namespace api\modules\v1\models;
 
use yii\db\ActiveRecord;

/**
 * This is the model class for table "user_booking".
 *
 * @property integer $ub_id
 * @property integer $user_id
 * @property integer $armada_id
 * @property string $alamat_penjemputan
 * @property string $start_datetime
 * @property string $end_datetime
 *
 * @property User $user
 * @property Armada $armada
 */
class UserBooking extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'user_booking';
    }

  public static function primaryKey()
    {
        return ['ub_id'];
    }
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['user_id', 'armada_id', 'alamat_penjemputan', 'start_datetime', 'end_datetime'], 'required'],
            [['user_id', 'armada_id'], 'integer'],
            [['alamat_penjemputan'], 'string'],
            [['start_datetime', 'end_datetime'], 'safe']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'ub_id' => 'Ub ID',
            'user_id' => 'User ID',
            'armada_id' => 'Armada ID',
            'alamat_penjemputan' => 'Alamat Penjemputan',
            'start_datetime' => 'Start Datetime',
            'end_datetime' => 'End Datetime',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getArmada()
    {
        return $this->hasOne(Armada::className(), ['armada_id' => 'armada_id']);
    }
}

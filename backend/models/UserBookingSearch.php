<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\UserBooking;

/**
 * UserBookingSearch represents the model behind the search form about `backend\models\UserBooking`.
 */
class UserBookingSearch extends UserBooking
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['ub_id', 'user_id', 'armada_id'], 'integer'],
            [['alamat_penjemputan', 'start_datetime', 'end_datetime'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = UserBooking::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'ub_id' => $this->ub_id,
            'user_id' => $this->user_id,
            'armada_id' => $this->armada_id,
            'start_datetime' => $this->start_datetime,
            'end_datetime' => $this->end_datetime,
        ]);

        $query->andFilterWhere(['like', 'alamat_penjemputan', $this->alamat_penjemputan]);

        return $dataProvider;
    }
}

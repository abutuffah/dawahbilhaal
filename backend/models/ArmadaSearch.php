<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Armada;

/**
 * ArmadaSearch represents the model behind the search form about `backend\models\Armada`.
 */
class ArmadaSearch extends Armada
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['armada_id'], 'integer'],
            [['armada_nama', 'armada_keterangan', 'status'], 'safe'],
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
        $query = Armada::find();

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
            'armada_id' => $this->armada_id,
        ]);

        $query->andFilterWhere(['like', 'armada_nama', $this->armada_nama])
            ->andFilterWhere(['like', 'armada_keterangan', $this->armada_keterangan])
            ->andFilterWhere(['like', 'status', $this->status]);

        return $dataProvider;
    }
}

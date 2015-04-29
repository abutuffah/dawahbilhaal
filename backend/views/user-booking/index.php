<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\modelsUserBookingSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'User Bookings';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="user-booking-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create User Booking', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            [
                'attribute'=>'user_id',
                'value'=>'user.firstname'
            ],
              [
                'attribute'=>'No Telepon',
                'value'=>'user.notelp'
            ],
              [
                'attribute'=>'armada_id',
                'value'=>'armada.armada_nama'
            ],
            'start_datetime',
            'end_datetime',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>

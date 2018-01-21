<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use frontend\models\Kelas;
use frontend\models\TahunAjaran;

/* @var $this yii\web\View */
/* @var $model frontend\models\SiswaKelasTahunAjaranSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="siswa-kelas-tahun-ajaran-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?php //$form->field($model, 'id') ?>

    <?php //$form->field($model, 'id_data_induk_siswa') ?>

    <?= $form->field($modelKelas,'id')->dropDownList(ArrayHelper::map(Kelas::find()->all(),'id','nama'),['prompt'=>'Pilih Kelas'])->label('kelas') ?>

    <?= $form->field($modelTahunAjaran,'id')->dropDownList(ArrayHelper::map(TahunAjaran::find()->all(),'id','nama'),['prompt'=>'Pilih Tahun Ajaran'])->label('Tahun Ajaran') ?>

    <?= $form->field($model, 'id_kelas_tahun_ajaran') ?>

    <?php //$form->field($model, 'created_at') ?>

    <?php //$form->field($model, 'updated_at') ?>

    <?php // echo $form->field($model, 'created_by') ?>

    <?php // echo $form->field($model, 'updated_by') ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Search'), ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton(Yii::t('app', 'Reset'), ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

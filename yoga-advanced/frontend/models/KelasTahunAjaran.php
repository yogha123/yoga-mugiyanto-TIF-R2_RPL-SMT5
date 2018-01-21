<?php

namespace frontend\models;

use Yii;
use yii\behaviors\TimestampBehavior;
use yii\behaviors\BlameableBehavior;
use yii\db\Expression;

/**
 * This is the model class for table "{{%tbl_kelas_tahun_ajaran}}".
 *
 * @property integer $id
 * @property integer $id_tahun_ajaran
 * @property integer $id_kelas
 * @property string $created_at
 * @property string $updated_at
 * @property integer $created_by
 * @property integer $updated_by
 *
 * @property User $createdBy
 * @property TblKelas $idKelas
 * @property TblTahunAjaran $idTahunAjaran
 * @property User $updatedBy
 * @property TblSiswaKelasTahunAjaran[] $tblSiswaKelasTahunAjarans
 */
class KelasTahunAjaran extends \yii\db\ActiveRecord
{
    public function behaviors(){
        return [
            [
                'class' =>TimestampBehavior::className(),
                'value' => new Expression('NOW()'),
            ],
            BlameableBehavior::className()
        ];
    }
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%tbl_kelas_tahun_ajaran}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id_tahun_ajaran', 'id_kelas'], 'required'],
            [['id_tahun_ajaran', 'id_kelas', 'created_by', 'updated_by'], 'integer'],
            [['created_at', 'updated_at'], 'safe'],
            [['created_by'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['created_by' => 'id']],
            [['id_kelas'], 'exist', 'skipOnError' => true, 'targetClass' => Kelas::className(), 'targetAttribute' => ['id_kelas' => 'id']],
            [['id_tahun_ajaran'], 'exist', 'skipOnError' => true, 'targetClass' => TahunAjaran::className(), 'targetAttribute' => ['id_tahun_ajaran' => 'id']],
            [['updated_by'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['updated_by' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'id_tahun_ajaran' => Yii::t('app', 'Id Tahun Ajaran'),
            'id_kelas' => Yii::t('app', 'Id Kelas'),
            'created_at' => Yii::t('app', 'Created At'),
            'updated_at' => Yii::t('app', 'Updated At'),
            'created_by' => Yii::t('app', 'Created By'),
            'updated_by' => Yii::t('app', 'Updated By'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCreatedBy()
    {
        return $this->hasOne(User::className(), ['id' => 'created_by']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getIdKelas()
    {
        return $this->hasOne(Kelas::className(), ['id' => 'id_kelas']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getIdTahunAjaran()
    {
        return $this->hasOne(TahunAjaran::className(), ['id' => 'id_tahun_ajaran']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUpdatedBy()
    {
        return $this->hasOne(User::className(), ['id' => 'updated_by']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTblSiswaKelasTahunAjarans()
    {
        return $this->hasMany(TblSiswaKelasTahunAjaran::className(), ['id_kelas_tahun_ajaran' => 'id']);
    }
}

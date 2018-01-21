<?php

namespace frontend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use frontend\models\KelasTahunAjaran;

/**
 * KelasTahunAjaranSearch represents the model behind the search form about `frontend\models\KelasTahunAjaran`.
 */
class KelasTahunAjaranSearch extends KelasTahunAjaran
{
    public $kelas;
    public $tahunAjaran;
    
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'id_tahun_ajaran', 'id_kelas', 'created_by', 'updated_by'], 'integer'],
            [['created_at', 'updated_at', 'kelas', 'tahunAjaran'], 'safe'],
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
        $query = KelasTahunAjaran::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $dataProvider->sort->attributes['kelas'] = [
            'asc' => ['tbl_kelas.nama' => SORT_ASC],
            'desc' => ['tbl_kelas.nama' => SORT_DESC]
        ];

        $dataProvider->sort->attributes['tahunAjaran'] = [
            'asc' => ['tbl_tahun_ajaran.nama' => SORT_ASC],
            'desc' => ['tbl_tahun_ajaran.nama' => SORT_DESC]
        ];

        $query->joinWith(['idTahunAjaran','idKelas']);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'id_tahun_ajaran' => $this->id_tahun_ajaran,
            'id_kelas' => $this->id_kelas,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'created_by' => $this->created_by,
            'updated_by' => $this->updated_by,
        ]);

        $query->andFilterWhere(['like','tbl_kelas',$this->kelas]);
        $query->andFilterWhere(['like','tbl_tahun_ajaran',$this->tahunAjaran]);

        return $dataProvider;
    }
}

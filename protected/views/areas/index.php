<?php
/* @var $this AreasController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Configuración'=>array('/configuracion'),
	'Areas',
);

$this->menu=array(
	array('label'=>'Administrar Areas', 'url'=>array('admin')),
);
?>

<h1>Areas</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>

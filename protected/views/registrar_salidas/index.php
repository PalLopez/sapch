<?php
/* @var $this Entradas_salidasController */
/* @var $model EntradasSalidas */
?>

<h1>Registrar Salida</h1>

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'entradas-salidas-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'fecha',
		'hr_entrada',
		'hr_salida',
		'id_usuario',
		array(
			'class'=>'CButtonColumn',
			'template'=>'{update}',
		),
	),
)); ?>

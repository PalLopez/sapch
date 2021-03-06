<?php
/* @var $this Entradas_salidasController */
/* @var $model EntradasSalidas */

$this->breadcrumbs=array(
	'Entradas/Salidas'=>array('index'),
	'Administrar',
);

$this->menu=array(
	array('label'=>'Nueva Entrada', 'url'=>array('create')),
	array('label'=>'Nueva Salida', 'url'=>array('')),
	array('label'=>'Lista Entradas/Salidas', 'url'=>array('index')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$('#entradas-salidas-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1>Administrar Entradas/Salidas</h1>

<?php echo CHtml::link('Busqueda Avanzada','#',array('class'=>'search-button')); ?>
<div class="search-form" style="display:none">
<?php $this->renderPartial('_search',array(
	'model'=>$model,
)); ?>
</div><!-- search-form -->

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'entradas-salidas-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'id',
		'fecha',
		'hr_entrada',
		'hr_salida',
		'id_usuario',
		array(
			'class'=>'CButtonColumn',
		),
	),
)); ?>

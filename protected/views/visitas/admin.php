<?php
/* @var $this VisitasController */
/* @var $model Visitas */

$this->breadcrumbs=array(
	'Visitases'=>array('index'),
	'Manage',
);

$this->menu=array(
	array('label'=>'List Visitas', 'url'=>array('index')),
	array('label'=>'Create Visitas', 'url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$('#visitas-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1>Manage Visitases</h1>

<p>
You may optionally enter a comparison operator (<b>&lt;</b>, <b>&lt;=</b>, <b>&gt;</b>, <b>&gt;=</b>, <b>&lt;&gt;</b>
or <b>=</b>) at the beginning of each of your search values to specify how the comparison should be done.
</p>

<?php echo CHtml::link('Advanced Search','#',array('class'=>'search-button')); ?>
<div class="search-form" style="display:none">
<?php $this->renderPartial('_search',array(
	'model'=>$model,
)); ?>
</div><!-- search-form -->

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'visitas-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'id',
		'hr_entrada',
		'hr_salida',
		'motivo',
		'fecha',
		'id_pe',
		/*
		'id_nino',
		*/
		array(
			'class'=>'CButtonColumn',
		),
	),
)); ?>
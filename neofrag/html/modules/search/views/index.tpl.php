<?php echo icon('fa-search big') ?>
<form action="<?php echo url('search') ?>" method="get">
	<div class="input-group">
		<input type="text" class="form-control input-lg" name="q" value="<?php echo utf8_htmlentities($keywords) ?>" placeholder="<?php echo $this->lang('Rechercher un ou plusieurs termes sur notre site') ?>" />
		<span class="input-group-append btn-group-lg">
			<button class="btn btn-primary btn-lg" type="submit"><?php echo icon('fa-search').' '.$this->lang('Rechercher') ?></button>
		</span>
	</div>
</form>
<?php if ($keywords !== '' && !$results): ?>
<h3><?php echo $this->lang('Aucun résultat trouvé pour <b>%s</b>', utf8_htmlentities($keywords)) ?></b></h3>
<?php endif ?>

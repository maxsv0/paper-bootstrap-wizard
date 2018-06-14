{include file="$themePath/widget/header.tpl"}

{include file="$themePath/widget/navigation.tpl"}

<div class="container">
    <div class="row content-block">
        <!-- page document header -->
        {if $document.name}
            <div class="col-sm-12"><h1>{$document.name}</h1></div>
        {/if}
        <!-- page document -->
        <div class="col-sm-12">
            {$document.text}
        </div>
    </div>
</div>

{include file="$themePath/widget/paper-bootstrap-wizard.tpl"}


{include file="$themePath/widget/footer.tpl"}
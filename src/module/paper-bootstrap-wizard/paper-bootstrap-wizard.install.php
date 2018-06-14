<?php

function Install_Paper_Bootstrap_Wizard($module) {
    // create website structure item
    $itemStructure = array(
        "url" => $module->activationUrl,
        "name" => "Paper Bootstrap Wizard",
        "template" => "custom",
        "page_template" => "paper-bootstrap-wizard.tpl",
        "sitemap" => 1,
        "menu" => "top",
        "menu_order" => 10,
    );
    msv_add_structure($itemStructure, array("lang" => "all"));
}


<?php


class hwbootTemplateUtils
{
    function hwbootTemplateUtils()
    {
    }

    function operatorList()
    {
        return array();
    }

    function namedParameterPerOperator()
    {
        return true;
    }

    function namedParameterList()
    {
        return array();
    }

    function modify( $tpl, $operatorName, $operatorParameters, $rootNamespace, $currentNamespace, &$operatorValue, $namedParameters )
    {
        $ret = '';

        switch ( $operatorName )
        {
            default:
                {

                } break;
        }
        $operatorValue = $ret;
    }

}

?>

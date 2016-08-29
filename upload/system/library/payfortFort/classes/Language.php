<?php

class Payfort_Fort_Language
{
    
    public static function __($input, $args = array(), $domain = 'payment/payfort_fort')
    {        
        Payfort_Fort_Util::getRegistry()->get('language')->load($domain);
        return Payfort_Fort_Util::getRegistry()->get('language')->get($input);
    }

    public static function getCurrentLanguageCode() 
    {
        return Payfort_Fort_Util::getRegistry()->get('language')->get('code');
    }
}

?>
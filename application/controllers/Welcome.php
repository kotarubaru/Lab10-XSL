<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {

	function __construct()
    {
        parent::__construct();
    }
    
	public function index()
	{
        $doc = new DOMDocument();
        $doc->load(DATAPATH . 'timetable.xml');
        
        libxml_use_internal_errors(true);
        
        $result;
        
        if ($doc->schemaValidate(DATAPATH . 'timetable.xsd'))
        {
            $result = 'Validated against schema successfully.';
        }
        else
        {
            $result = '<b>XML Errors Encountered:</b><br/>';
            foreach (libxml_get_errors() as $error)
            {
                $result .= $error->message . '<br/>';
            }
        }
        
        libxml_clear_errors();
        
        $data = array('validation' => $result);
        
        $this->load->library('parser');
        $this->parser->parse('welcome_message', $data);
	}
}
